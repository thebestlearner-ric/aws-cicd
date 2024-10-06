variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_security_group" {
  type = list(string)
}

variable "rds_username" {
  type = string
}

variable "rds_password" {
  type = string
}