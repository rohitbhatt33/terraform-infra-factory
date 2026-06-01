module "development_network" {
  source = "../../modules/vpc"

  environment          = "dev"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.11.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "dev_app_server" {
  source = "../../modules/ec2"

  environment   = "dev"
  instance_type = "t2.micro" # 100% Free-tier safe
  vpc_id        = module.development_network.vpc_id

  # Placing it into our first public subnet for easy testing right now
  subnet_id = module.development_network.public_subnet_ids[0]
}