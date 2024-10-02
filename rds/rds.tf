resource "aws_db_instance" "rds_mariadb" {
  allocated_storage    = 20
  engine               = "mariadb"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.rds_username
  password             = var.rds_password
  parameter_group_name = "default.mariadb10.5"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.eks_security_group.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
}

resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id]
}
