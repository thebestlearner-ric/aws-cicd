resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = var.eks_role_arn   # Use the passed-in EKS IAM role ARN

  vpc_config {
    subnet_ids         = var.public_subnet_ids  # Pass the public subnet IDs from the vpc module
    security_group_ids = var.eks_security_group # Pass the eks security group IDs from the vpc module
  }

}

resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "my-eks-node-group"
  node_role_arn   = var.eks_node_role_arn  # Use the passed-in EKS Node IAM role ARN
  subnet_ids      = var.public_subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t3.medium"]

  depends_on = [aws_eks_cluster.eks_cluster]
}