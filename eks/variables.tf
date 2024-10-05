variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "eks_security_group" {
  type = list(string)
}

variable "eks_role_arn" {
  type = string
}

variable "eks_node_role_arn" {
  type = string
}
