output "rds_username" {
  value     = data.aws_secretsmanager_secret_version.rds_username.secret_string
  sensitive = true
}

output "rds_password" {
  value     = data.aws_secretsmanager_secret_version.rds_password.secret_string
  sensitive = true
}
