provider "aws" {
  region = "us-west-2"
}

module "backend" {
  source = "./backend"
}
# Load variables from AWS Secrets Manager
module "secrets" {
  source = "./secrets"
}

module "iam" {
  source = "./iam"
}

# Load VPC and networking resources
module "vpc" {
  source = "./vpc"
}

# Create EKS Cluster and Worker Nodes
module "eks" {
  source = "./eks"

  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  public_subnet_ids   = module.vpc.public_subnet_ids
  eks_security_group =  module.vpc.eks_security_group
  eks_role_arn        = module.iam.eks_role_arn           # Pass the EKS IAM role ARN
  eks_node_role_arn   = module.iam.eks_node_role_arn      # Pass the EKS Node IAM role ARN
}

# Create RDS MariaDB Instance
module "rds" {
  source = "./rds"

  vpc_id            = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  eks_security_group =  module.vpc.eks_security_group
  rds_username = module.secrets.rds_username
  rds_password = module.secrets.rds_password
}


