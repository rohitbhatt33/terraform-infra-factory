# Multi-Environment Infrastructure-as-Code (IaC) Factory

A production-ready, modular Terraform framework designed to provision highly available, secure AWS infrastructure. This project demonstrates modern DevOps engineering practices, including remote state synchronization, state locking, structural component isolation, and automated validation/deployment via a GitHub Actions CI/CD pipeline.

---

## 🏗️ Architecture Overview

The infrastructure blueprint separates reusable logic (modules) from environment-specific declarations (environments). 

```text
terraform-infra-factory/
├── .github/workflows/    # CI/CD pipelines (Automation)
├── modules/              # Reusable infrastructure engines
│   ├── vpc/              # Multi-AZ Custom Network Topology
│   └── ec2/              # Security-hardened Compute Module
└── environments/         # Live Environment configurations
    └── dev/              # Development Environment instantiation

Infrastructure Layout

Custom VPC: Configured with an isolated IP allocation strategy (10.0.0.0/16).

High Availability Multi-AZ Routing: Network resources span multiple Availability Zones (us-east-1a and us-east-1b).

Public & Private Tier Isolation: - Public Subnets: House the application load routing boundaries and a NAT Gateway to handle outbound internet translations.

Private Subnets: Reserve fully isolated network spaces intended for backend systems or worker nodes.

Compute Layer: An automated Ubuntu Linux application host configured with dedicated inbound/outbound security group firewalls, running within a Free-Tier boundary (t2.micro).

🔒 Enterprise State Management

To avoid single points of failure and configuration drift, this architecture utilizes a remote backend setup:

AWS S3 Backend: Stores the terraform.tfstate file centrally with server-side encryption enabled.

DynamoDB State Locking: Implements concurrency control via a LockID primary key schema to prevent parallel executions from corrupting infrastructure state.

🚀 CI/CD Automation Pipeline

Every pull request or code push to the main branch triggers an automated quality assurance pipeline via GitHub Actions (terraform-ci.yml). This ensures no broken configurations ever reach production.

The pipeline executes the following checks sequentially:

Formatting Guard (terraform fmt): Validates and enforces unified syntax spacing across the codebase.

Structural Validation (terraform validate): Evaluates local expressions, loops, and attribute declarations.

Advanced Cloud Linting (TFLint): Catches provider-specific architectural anomalies (e.g., verifying AWS instance types and naming restrictions) before cloud execution.

Continuous Deployment (terraform apply): Executes an automated, non-interactive deployment (-auto-approve) only when changes successfully pass all quality tests and are merged directly into the main branch.

🛠️ Local Execution & Quick Start
Prerequisites
Terraform CLI (>= 1.5.0)

AWS CLI v2 configured with active IAM admin credentials.

Deploying Locally
Clone the repository and navigate to the targeted workspace folder:

cd environments/dev

Initialize the backend storage and download provider modules:

terraform init

Generate and verify an execution dry-run blueprint:

terraform plan

Build the live cloud resources:

terraform apply


🔑 Key Professional Highlights (Interview Deep Dives)

DRY Compliance: Used Terraform modularization to cleanly separate core architectural engines from environment-specific configurations (/modules vs /environments).

Global Tagging Strategy: Implemented the default_tags structural block at the AWS provider layer to force cost tracking, accountability, and metadata propagation natively across every single provisioned cloud asset.

Secured Local Environment: Completely eliminated vulnerable static access credentials inside GitHub files by leveraging secure, repository-specific GitHub Actions encrypted secret stores.    