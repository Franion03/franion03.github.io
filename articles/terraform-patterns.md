---
title: "Infrastructure as Code: Terraform Patterns for Multi-Environment ML Platforms"
published: false
tags: terraform, iac, aws, mlops
cover_image:
---

When you're running ML workloads across development, staging, and production, "it works on my machine" extends to entire infrastructure stacks. A model training pipeline that works in dev but fails in production because someone manually tweaked an S3 bucket policy is a special kind of pain. This is where Infrastructure as Code stops being a nice-to-have and becomes essential.

I've spent the past year building and maintaining Terraform configurations for ML platforms at Swisscom — EKS clusters for model serving, SageMaker for training, S3 for artifact storage, ECR for container images. Here are the patterns that survived contact with reality.

## Why IaC Matters Specifically for MLOps

MLOps has unique infrastructure challenges that make IaC non-negotiable:

**Reproducible environments.** When a model behaves differently in production, you need to rule out infrastructure drift. If your dev and prod environments are defined in code, you know they're structurally identical.

**Audit trail.** Regulated industries require you to prove who changed what, when, and why. Git history on your Terraform configs gives you this for free.

**Drift detection.** Someone adds a lifecycle rule to your model artifact bucket via the console. Your next `terraform plan` catches it. Without IaC, that change is invisible until something breaks.

## Module Composition: Build Once, Deploy Everywhere

The first pattern that pays dividends is treating infrastructure as composable modules. Each AWS resource type gets its own module with a clean interface:

```hcl
# modules/s3-ml-bucket/main.tf
resource "aws_s3_bucket" "this" {
  bucket = "${var.project}-${var.environment}-${var.purpose}"

  tags = merge(var.tags, {
    Environment = var.environment
    ManagedBy   = "terraform"
  })
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "archive-old-artifacts"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
```

```hcl
# modules/s3-ml-bucket/variables.tf
variable "project"     { type = string }
variable "environment" { type = string }
variable "purpose"     { type = string }
variable "tags"        { type = map(string); default = {} }
```

```hcl
# modules/s3-ml-bucket/outputs.tf
output "bucket_arn"  { value = aws_s3_bucket.this.arn }
output "bucket_name" { value = aws_s3_bucket.this.id }
```

I keep modules for `s3-ml-bucket`, `ecr-repo`, `eks-cluster`, `sagemaker-endpoint`, and `iam-ml-role`. Each module owns exactly one concern.

## Multi-Environment Strategy: Directory Structure Over Workspaces

Terraform workspaces seem appealing for multi-environment setups, but they share state backend configuration and make it too easy to accidentally apply dev changes to production. I recommend the directory-based approach:

```
infrastructure/
├── modules/
│   ├── s3-ml-bucket/
│   ├── ecr-repo/
│   ├── eks-cluster/
│   └── sagemaker-endpoint/
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   ├── staging/
│   │   └── ...
│   └── production/
│       └── ...
└── terragrunt.hcl
```

Each environment directory has its own state file, its own backend configuration, and its own variable values. You physically cannot apply production changes from the dev directory.

## State Management: Isolation is Everything

Remote state with S3 + DynamoDB locking is the standard, but the key insight is **one state file per environment per component**:

```hcl
# environments/production/backend.tf
terraform {
  backend "s3" {
    bucket         = "mlops-terraform-state"
    key            = "production/ml-platform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

State isolation means a bad `terraform destroy` in dev cannot touch production state. The DynamoDB lock prevents concurrent applies from corrupting state during CI runs.

## ML-Specific Resources

Here's where it gets interesting. ML platforms need resources that traditional web apps don't:

```hcl
# SageMaker endpoint for model serving
module "fraud_model_endpoint" {
  source = "../../modules/sagemaker-endpoint"

  model_name    = "fraud-detection"
  environment   = "production"
  instance_type = "ml.m5.xlarge"
  instance_count = 2

  model_data_url = "s3://${module.model_bucket.bucket_name}/models/fraud/latest/model.tar.gz"
  container_image = "${module.serving_ecr.repository_url}:latest"
}

# ECR for serving containers
module "serving_ecr" {
  source      = "../../modules/ecr-repo"
  name        = "ml-serving"
  environment = "production"
}

# S3 for model artifacts with versioning
module "model_bucket" {
  source      = "../../modules/s3-ml-bucket"
  project     = "mlops"
  environment = "production"
  purpose     = "model-artifacts"
}
```

## Terragrunt for DRY Multi-Environment Configs

When your environments share 90% of their configuration, Terragrunt eliminates the duplication:

```hcl
# environments/production/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules//ml-platform"
}

inputs = {
  environment    = "production"
  eks_node_count = 3
  sagemaker_instance_type = "ml.m5.xlarge"
  enable_autoscaling = true
}
```

```hcl
# terragrunt.hcl (root)
remote_state {
  backend = "s3"
  config = {
    bucket         = "mlops-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

## Drift Detection in CI

Run `terraform plan` on every merge request. If the plan shows unexpected changes, something drifted:

```yaml
# .gitlab-ci.yml
plan:
  stage: validate
  script:
    - terraform init
    - terraform plan -detailed-exitcode -out=plan.tfplan
  rules:
    - if: $CI_MERGE_REQUEST_IID
  allow_failure:
    exit_codes: 2  # exit code 2 = changes detected

apply:
  stage: deploy
  script:
    - terraform init
    - terraform apply -auto-approve plan.tfplan
  rules:
    - if: $CI_COMMIT_BRANCH == "main"
  when: manual
  environment:
    name: production
```

Exit code 2 from `plan -detailed-exitcode` means changes exist. In a scheduled pipeline, this becomes your drift detection alarm — if changes appear without a corresponding commit, someone touched the console.

## Lessons Learned the Hard Way

**Use `prevent_destroy` on stateful resources.** Your model artifact bucket and RDS instances should never be accidentally destroyed:

```hcl
resource "aws_s3_bucket" "models" {
  # ...
  lifecycle {
    prevent_destroy = true
  }
}
```

**Import before you recreate.** When adopting IaC for existing infrastructure, `terraform import` is your friend. I've seen people destroy and recreate production databases because they didn't know import existed.

**Lifecycle rules save money.** ML generates enormous amounts of data — training checkpoints, intermediate artifacts, experiment logs. Set lifecycle rules from day one. Moving 90-day-old artifacts to Glacier cut our storage costs by 40%.

**Tag everything.** Cost allocation for ML workloads is notoriously hard. Consistent tags (`project`, `environment`, `team`, `managed-by`) applied via module defaults make it tractable.

**State file backups.** Enable versioning on your state bucket. A corrupted state file without backups is an existential infrastructure problem.

## Wrapping Up

The investment in proper Terraform structure pays off the first time you need to spin up a new environment for a client demo, debug a production issue by comparing environments, or prove to an auditor that your ML infrastructure changes are tracked and reviewed.

Start with modules, enforce directory-based environments, lock your state, and run plan in CI. Everything else builds on those foundations.

## Resources

- [Terraform Module Best Practices](https://developer.hashicorp.com/terraform/language/modules/develop)
- [Terragrunt Documentation](https://terragrunt.gruntwork.io/)
- [AWS Provider - SageMaker Resources](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sagemaker_endpoint)
- [aqua-os-infrastructure](https://github.com/franion03/aqua-os-infrastructure) — My Terraform configs for ML platform infra
- [mlops-pipeline](https://github.com/franion03/mlops-pipeline) — End-to-end ML pipeline with IaC

---

*Francisco Javier Quiles Ruiz — MLOps Engineer building ML platforms on AWS. Find me on [GitHub](https://github.com/franion03) and [LinkedIn](https://linkedin.com/in/franciscojaviermlopsengineer).*
