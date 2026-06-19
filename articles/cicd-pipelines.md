---
title: "CI/CD Pipelines That Don't Break at 3 AM: Lessons from Production"
published: false
tags: cicd, devops, mlops, gitlab
---

You know that feeling. It's 3 AM, your phone buzzes, and the deployment pipeline has failed halfway through a production rollout. Half your pods are running the new version, half the old one, and nobody documented how to roll back. I've been there. After two years of building and operating CI/CD pipelines for ML workloads at Swisscom, I've learned that the difference between a pipeline that wakes you up and one that lets you sleep is entirely about design decisions made upfront.

Here's what I've learned running pipelines at scale — and the patterns that actually work.

## The Problem: Why Pipelines Break

Most pipeline failures I've debugged fall into three categories:

1. **Flaky tests** — Tests that pass locally but fail in CI due to timing, network calls, or shared state. They erode trust until teams start ignoring failures entirely.
2. **No rollback strategy** — The pipeline can deploy forward but nobody planned for "oh no, go back." Manual rollbacks at 3 AM are error-prone and slow.
3. **Fragile coupling** — A change in one service breaks an unrelated pipeline stage because everything runs sequentially with implicit dependencies.

The fix isn't more YAML. It's architecture.

## Pipeline Architecture: Five Stages That Actually Work

After iterating through dozens of configurations, I've settled on this stage progression:

```
test → build → deploy-staging → canary → production
```

Each stage has a clear contract: it either passes cleanly or blocks everything downstream. No "allowed to fail" stages in the critical path — that's how you get half-deployed services.

```yaml
stages:
  - test
  - build
  - deploy-staging
  - canary
  - production
```

Let me walk through the patterns that make each stage reliable.

## Pattern 1: Canary Deployments with Traffic Splitting

Instead of flipping 100% of traffic to the new version and praying, we use ArgoCD Rollouts to gradually shift traffic:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
  name: ml-inference-service
spec:
  strategy:
    canary:
      steps:
        - setWeight: 5
        - pause: { duration: 5m }
        - setWeight: 25
        - pause: { duration: 10m }
        - setWeight: 50
        - pause: { duration: 10m }
        - setWeight: 100
      analysis:
        templates:
          - templateName: latency-and-error-rate
        startingStep: 1
```

5% of traffic hits the new version first. If latency spikes or error rates climb, ArgoCD automatically rolls back before most users notice. The key insight: **the canary analysis runs continuously**, not just at the end.

## Pattern 2: Automated Rollbacks on Metric Degradation

The analysis template queries Prometheus for real signals:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
  name: latency-and-error-rate
spec:
  metrics:
    - name: error-rate
      successCondition: result[0] < 0.02
      provider:
        prometheus:
          query: |
            sum(rate(http_requests_total{status=~"5.*",app="{{args.service}}"}[5m]))
            / sum(rate(http_requests_total{app="{{args.service}}"}[5m]))
    - name: p99-latency
      successCondition: result[0] < 500
      provider:
        prometheus:
          query: |
            histogram_quantile(0.99, rate(http_request_duration_ms_bucket{app="{{args.service}}"}[5m]))
```

If the error rate exceeds 2% or p99 latency crosses 500ms, the rollout aborts automatically. No human in the loop needed at 3 AM.

## Pattern 3: Parallel Test Execution

Sequential test stages are a pipeline killer. A 20-minute test suite becomes 6 minutes when parallelized properly:

```yaml
test:unit:
  stage: test
  parallel: 4
  script:
    - pytest tests/unit --splits=$CI_NODE_TOTAL --group=$CI_NODE_INDEX
  cache:
    key: pip-${CI_COMMIT_REF_SLUG}
    paths:
      - .venv/

test:integration:
  stage: test
  services:
    - postgres:15
    - redis:7
  script:
    - pytest tests/integration -x --timeout=60
```

The `parallel` keyword splits unit tests across 4 runners. Integration tests run concurrently in a separate job with their own service containers. Both must pass before `build` starts.

## Pattern 4: Aggressive Caching

Every minute spent downloading dependencies is a minute your pipeline is fragile to network issues:

```yaml
build:
  stage: build
  script:
    - docker build
        --cache-from $CI_REGISTRY_IMAGE:cache
        --build-arg BUILDKIT_INLINE_CACHE=1
        -t $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA .
    - docker push $CI_REGISTRY_IMAGE:$CI_COMMIT_SHORT_SHA
  cache:
    key: docker-${CI_COMMIT_REF_SLUG}
    paths:
      - .docker-cache/
```

We cache Docker layers between builds and pip/npm dependencies between test runs. Build times dropped from 8 minutes to under 2 minutes for incremental changes.

## ML-Specific CI/CD: Training Pipelines Need Gates

ML workloads add a layer of complexity. You can't just "build and deploy" a model — you need evaluation gates:

```yaml
train:model:
  stage: build
  rules:
    - changes:
        - training/**
        - data/features/**
  script:
    - python -m training.run --experiment=$CI_COMMIT_SHORT_SHA
    - python -m training.evaluate --min-accuracy=0.92 --max-latency-ms=50
  artifacts:
    paths:
      - models/

promote:model:
  stage: deploy-staging
  script:
    - mlflow models transition-stage
        --name $MODEL_NAME
        --version $MODEL_VERSION
        --stage Staging
  rules:
    - when: manual
      allow_failure: false
```

The training job only triggers when training code or feature definitions change. The evaluation script acts as a gate — if accuracy drops below 0.92 or inference latency exceeds 50ms, the pipeline fails. No degraded model reaches production.

Model promotion to production is always manual. Automated training is fine; automated production promotion for ML models is asking for trouble.

## Observability: Know Before Your Users Do

A pipeline without observability is flying blind. We track three things:

1. **Pipeline metrics** — Duration per stage, failure rate by stage, flaky test frequency. Exported to Grafana via the GitLab CI API.
2. **Deployment frequency** — How often we actually ship to production. A leading indicator of team health.
3. **Alert routing** — Pipeline failures page to OpsGenie during business hours, Slack outside hours. Production deployment failures always page.

```yaml
.notify:
  after_script:
    - |
      if [ "$CI_JOB_STATUS" == "failed" ]; then
        curl -X POST "$OPSGENIE_WEBHOOK" \
          -H "Content-Type: application/json" \
          -d "{\"message\":\"Pipeline failed: $CI_PROJECT_NAME/$CI_PIPELINE_ID stage=$CI_JOB_STAGE\"}"
      fi
```

The rule is simple: if a production pipeline fails, someone should know within 60 seconds — not when a customer reports it.

## Lessons from Production

After running this architecture across multiple services:

- **Flaky tests get quarantined immediately.** We have a `quarantine` label in pytest that moves flaky tests out of the critical path while someone fixes them. Zero tolerance for "retry and hope."
- **Every pipeline must be idempotent.** If you re-run any stage, it should produce the same result. This means no side effects in test stages and declarative deployments.
- **Rollback is not optional.** If you can't roll back in under 2 minutes without human intervention, your pipeline isn't production-ready.
- **Cache everything, trust nothing.** Cache aggressively for speed, but always have a `cache:policy: pull-push` fallback that rebuilds from scratch.
- **Monitor the pipeline itself.** Your CI/CD system is infrastructure. Treat it like any other production service.

## Pre-Production Checklist

Before calling any pipeline "production-ready," verify:

- [ ] Every stage has a timeout (prevents zombie jobs)
- [ ] Rollback path tested and documented
- [ ] Canary analysis configured with real metrics
- [ ] Flaky tests quarantined, not `allow_failure: true`
- [ ] Caching configured for dependencies and Docker layers
- [ ] Alert routing for failures (OpsGenie, Slack, or equivalent)
- [ ] Pipeline duration tracked and alerting on regression
- [ ] Manual gate before production for ML model promotions
- [ ] Secrets managed via CI/CD variables (masked + protected)
- [ ] Pipeline runs idempotently on retry

---

The full implementation — including ML training triggers, evaluation gates, and ArgoCD rollout configs — is in my [mlops-pipeline](https://github.com/franion03/mlops-pipeline) repo. Feel free to steal what works for you.

Pipelines shouldn't wake you up at 3 AM. Design them so they fix themselves — or at least fail gracefully while you sleep.
