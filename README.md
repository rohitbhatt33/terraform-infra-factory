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