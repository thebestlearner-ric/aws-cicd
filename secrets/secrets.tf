# Create the RDS username secret
resource "aws_secretsmanager_secret" "rds_username" {
  name = "/mariadb/username"
}

# Create the RDS password secret
resource "aws_secretsmanager_secret" "rds_password" {
  name = "/mariadb/password"
}

# Store the RDS username in Secrets Manager
resource "aws_secretsmanager_secret_version" "rds_username_version" {
  secret_id     = aws_secretsmanager_secret.rds_username.id
  secret_string = "admin"  # Replace with actual username or dynamic value
}

# Store the RDS password in Secrets Manager (randomly generated)
resource "aws_secretsmanager_secret_version" "rds_password_version" {
  secret_id     = aws_secretsmanager_secret.rds_password.id
  secret_string = random_password.master_password.result
}

# Generate a random password
resource "random_password" "master_password" {
  length  = 16
  special = true
}

# Retrieve the username secret from Secrets Manager
data "aws_secretsmanager_secret_version" "rds_username" {
  secret_id = aws_secretsmanager_secret.rds_username.id
}

# Retrieve the password secret from Secrets Manager
data "aws_secretsmanager_secret_version" "rds_password" {
  secret_id = aws_secretsmanager_secret.rds_password.id
}
