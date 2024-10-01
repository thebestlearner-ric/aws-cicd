# Load variables from AWS Secrets Manager
module "secrets" {
  source = "./secrets.tf"
}

# Load VPC and networking resources
module "vpc" {
  source = "./vpc.tf"
}

# Create EKS Cluster and Worker Nodes
module "eks" {
  source = "./eks.tf"
}

# Create RDS MariaDB Instance
module "rds" {
  source = "./rds.tf"

  # Pass in sensitive RDS credentials from AWS Secrets Manager
  username = module.secrets.rds_username
  password = module.secrets.rds_password
}

# Outputs (optional)
output "eks_cluster_name" {
  value = module.eks.eks_cluster_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}
