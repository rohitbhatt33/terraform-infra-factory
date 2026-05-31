variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "The AWS Availability Zones to deploy subnets into"
}

variable "environment" {
  type        = string
  description = "The deployment environment name (e.g., dev, prod)"
}