variable "vpc_id" {
  type = string
}

variable "region" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "bastian_subnet_id" {
  type = string
}

variable "allow_ssh_security_group_id" {
  type = string
}

variable "jump_server_role_name" {
  type = string
}

variable "jump_server_name" {
  type = string
}

variable "jump_server_public_key" {
  type = string
}

variable "instance_type" {
  type = string
}