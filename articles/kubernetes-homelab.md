---
title: "Building a Kubernetes Home Lab: From Zero to Production-Grade GitOps"
published: false
tags: kubernetes, homelab, gitops, devops
cover_image:
---

As an MLOps Engineer working with production Kubernetes clusters daily, I kept hitting the same problem: I wanted a safe place to break things. Testing new ArgoCD patterns, experimenting with model serving architectures, or validating CI/CD pipelines before pushing to production — all of this needs a real cluster, not just `kind` running on your laptop for 20 minutes.

So I built a home lab. Here's how you can too.

## Why Bother With a Home Lab?

Cloud Kubernetes is expensive for experimentation. A 3-node EKS cluster runs ~$200/month before you even deploy anything. A home lab gives you:

- **Unlimited experimentation time** — break things at 2 AM without worrying about costs
- **Real networking** — LoadBalancers, DNS, TLS certificates behave differently than port-forwards
- **MLOps pipeline testing** — validate model serving, feature stores, and training pipelines end-to-end
- **GitOps muscle memory** — practice the exact ArgoCD patterns you'll use in production
- **Interview prep** — nothing beats "I run a production-grade K8s cluster at home" in a conversation

The goal isn't to replicate AWS. It's to build something close enough that your workflows transfer directly to production.

## Hardware: Keep It Simple

You have two practical paths:

### Option A: Raspberry Pi Cluster (My Choice)

- 3x Raspberry Pi 4 (8GB) — ~€75 each
- 3x 128GB microSD cards (or USB SSDs for longevity)
- 1x Gigabit switch
- 1x PoE HAT + PoE switch (optional, reduces cable mess)

Total: ~€300-400

### Option B: Old Laptops / Mini PCs

- 2-3 old laptops or Intel NUCs
- Built-in battery = free UPS
- More RAM and x86 compatibility

Both work. The Pi cluster is more fun to look at, but old laptops give you more RAM and avoid ARM compatibility headaches. I went with Pis because constraints force you to learn resource management — a skill that pays off in production.

## Architecture Overview

```
┌─────────────────────────────────────────────┐
│                  GitOps Repo                 │
│  (ArgoCD watches for changes)               │
└──────────────────────┬──────────────────────┘
                       │
┌──────────────────────▼──────────────────────┐
│              k3s Cluster (3 nodes)           │
├─────────────────────────────────────────────┤
│  MetalLB (L2)  │  Longhorn  │  cert-manager │
├─────────────────────────────────────────────┤
│  ArgoCD  │  Prometheus  │  Grafana  │  Loki │
├─────────────────────────────────────────────┤
│  App workloads: model serving, APIs, etc.   │
└─────────────────────────────────────────────┘
```

### k3s: Lightweight Kubernetes That Actually Works

k3s strips out the heavy parts of upstream Kubernetes (etcd replaced with SQLite/embedded, no cloud controller manager) while keeping full API compatibility. Install on your first node:

```bash
curl -sfL https://get.k3s.io | sh -s - server \
  --disable traefik \
  --disable servicelb \
  --write-kubeconfig-mode 644
```

I disable the built-in Traefik and ServiceLB because we'll use our own ingress and MetalLB. Join worker nodes:

```bash
curl -sfL https://get.k3s.io | K3S_URL=https://<server-ip>:6443 \
  K3S_TOKEN=<token> sh -
```

### MetalLB: Real LoadBalancers at Home

Without a cloud provider, `type: LoadBalancer` services stay in `Pending` forever. MetalLB fixes this by assigning IPs from a pool on your local network:

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: home-pool
  namespace: metallb-system
spec:
  addresses:
    - 192.168.1.200-192.168.1.220
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: home-l2
  namespace: metallb-system
spec:
  ipAddressPools:
    - home-pool
```

Now your services get real IPs accessible from any device on your network.

### Longhorn: Distributed Storage

Persistent volumes need a storage backend. Longhorn replicates data across nodes and provides snapshots — essential when your microSD card inevitably dies:

```bash
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/deploy/longhorn.yaml
```

Set it as default StorageClass and you're done. Your PVCs now survive node failures.

## GitOps with ArgoCD: The App-of-Apps Pattern

This is where the home lab becomes production-grade. Instead of `kubectl apply`, every change goes through Git.

### Repository Structure

```
k8s-homelab/
├── argocd/
│   └── app-of-apps.yaml        # Root application
├── infrastructure/
│   ├── metallb/
│   ├── longhorn/
│   ├── cert-manager/
│   └── monitoring/
├── apps/
│   ├── model-serving/
│   ├── api-gateway/
│   └── feature-store/
└── environments/
    ├── base/
    └── overlays/
        └── homelab/
```

### The Root Application

ArgoCD watches a single "app-of-apps" that bootstraps everything else:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: app-of-apps
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/franion03/k8s-homelab.git
    targetRevision: main
    path: argocd
  destination:
    server: https://kubernetes.default.svc
    namespace: argocd
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

Push a new app manifest to the `argocd/` directory and it deploys automatically. Delete the file and the app gets pruned. This is the same pattern I use in my [e-commerce-k8s-stack](https://github.com/franion03/e-commerce-k8s-stack) repo for a production-grade deployment.

## Deploying Real Workloads

### Model Serving with Seldon Core / KServe

A home lab is perfect for testing ML model deployments:

```yaml
apiVersion: serving.kserve.io/v1beta1
kind: InferenceService
metadata:
  name: sklearn-classifier
spec:
  predictor:
    model:
      modelFormat:
        name: sklearn
      storageUri: "s3://models/classifier/v1"
      resources:
        limits:
          memory: 512Mi
          cpu: 500m
```

On ARM (Raspberry Pi), you'll need to build multi-arch images or stick to models with ARM-compatible runtimes. TensorFlow Lite and ONNX Runtime work well.

### Monitoring with Prometheus + Grafana

Deploy the kube-prometheus-stack via ArgoCD:

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: monitoring
spec:
  source:
    repoURL: https://prometheus-community.github.io/helm-charts
    chart: kube-prometheus-stack
    targetRevision: 55.5.0
    helm:
      values: |
        grafana:
          persistence:
            enabled: true
        prometheus:
          prometheusSpec:
            retention: 7d
            resources:
              requests:
                memory: 256Mi
              limits:
                memory: 512Mi
```

Tight resource limits are critical on a home lab. Prometheus will happily eat all your RAM if you let it.

## Lessons Learned (The Hard Way)

### 1. ARM Compatibility Is Still Painful

Not every container image supports `linux/arm64`. Check Docker Hub for multi-arch manifests before committing to a tool. When in doubt, build your own:

```dockerfile
FROM --platform=$TARGETPLATFORM python:3.12-slim
```

### 2. Resource Limits Are Non-Negotiable

With 8GB per node, you MUST set requests and limits on everything. A single pod without limits can OOMKill your entire node. My rule: `memory request == memory limit`, always.

### 3. Networking Gotchas

- MetalLB L2 mode doesn't work across subnets. Keep all nodes on the same VLAN.
- If you use a VPN, your `externalTrafficPolicy: Local` won't see real client IPs.
- DNS resolution: run a local Pi-hole or CoreDNS with custom entries for your services.

### 4. cert-manager + Let's Encrypt

Use DNS-01 challenges (not HTTP-01) for internal services. Cloudflare's free tier works perfectly as a DNS provider for ACME challenges, even for `.local` domains with a real domain delegated to it.

### 5. SD Cards Die

MicroSD cards are not designed for persistent I/O. Either boot from USB SSD or use Longhorn to replicate data across nodes. I lost a week of Prometheus data learning this.

## What This Looks Like in Practice

My [e-commerce-k8s-stack](https://github.com/franion03/e-commerce-k8s-stack) repository demonstrates these exact patterns at a larger scale — a full GitOps-first Kubernetes infrastructure with ArgoCD managing the entire deployment lifecycle. It's the production evolution of what started as home lab experiments.

## Next Steps

Once your lab is running:

1. **Add a CI pipeline** — GitHub Actions building images, pushing to a local registry, updating GitOps manifests
2. **Implement progressive delivery** — Argo Rollouts for canary deployments
3. **Multi-cluster** — add a second k3s cluster and practice federation
4. **Chaos engineering** — run Litmus or Chaos Mesh to validate your HA setup

The best part? Every pattern you learn here transfers directly to production EKS/GKE/AKS clusters. The APIs are the same. The GitOps workflow is the same. Only the scale changes.

Start small. Break things. Fix them. That's the whole point.

---

*If you found this useful, check out my [e-commerce-k8s-stack](https://github.com/franion03/e-commerce-k8s-stack) for a complete production example, or connect with me to chat about Kubernetes, MLOps, and GitOps patterns.*
