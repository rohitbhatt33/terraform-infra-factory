terraform {
  required_version = ">= 1.5.0" # Ensures you are using a modern version of Terraform

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Uses AWS Provider version 5.x, preventing breaking changes from v6.0+
    }
  }
}

provider "aws" {
  region = "us-east-1" # Feel free to change this to your closest region
  
  default_tags {
    tags = {
      Environment = "Development"
      Project     = "InfraFactory"
      ManagedBy   = "Terraform"
    }
  }
}

