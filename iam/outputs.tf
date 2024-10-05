# Output the IAM role ARNs for use in the EKS module
output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}
