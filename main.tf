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

# Load VPC and networking resources
module "vpc" {
  source = "./vpc"
}

# Create EKS Cluster and Worker Nodes
module "eks" {
  source = "./eks"
}

# Create RDS MariaDB Instance
module "rds" {
  source = "./rds"

  # Pass in sensitive RDS credentials from AWS Secrets Manager
  username = module.secrets.rds_username
  password = module.secrets.rds_password
}

# Outputs (optional)
output "eks_name" {
  value = module.eks.eks_cluster_name
}

output "rds_name" {
  value = module.rds.rds_endpoint
}
