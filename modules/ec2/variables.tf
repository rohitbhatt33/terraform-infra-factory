variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID where the EC2 instance will be deployed"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to associate the security group with"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro" # Keeps it free-tier friendly!
  description = "The size of the instance"
}