output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "rds_endpoint" {
  value = aws_db_instance.rds_mariadb.endpoint
}
