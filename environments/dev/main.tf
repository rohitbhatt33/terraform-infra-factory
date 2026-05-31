module "development_network" {
  source = "../../modules/vpc"

  environment          = "dev"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  
  # Replace these with availability zones in your configured AWS region (e.g., ap-south-1a, ap-south-1b)
  availability_zones   = ["us-east-1a", "us-east-1b"] 
}