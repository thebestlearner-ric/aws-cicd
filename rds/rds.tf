resource "aws_db_instance" "rds_mariadb" {
  allocated_storage    = 20
  engine               = "mariadb"
  instance_class       = "db.t3.micro"
  username             = var.rds_username
  password             = var.rds_password
  parameter_group_name = "default.mariadb10.5"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = var.eks_security_group
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
}

resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids  # Use private subnet IDs passed from the vpc module
}


resource "random_password" "master_password" {
  length  = 16
  special = false
}


resource "aws_secretsmanager_secret" "rds_credentials" {
  name = "credentials"
}
