variable "region" {
  type = string
}

variable "az1" {
  type = string
}

variable "az2" {
  type = string
}

variable "eks_cluster_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "eks_cidr" {
  type = string
}

variable "eks_node_group_cidr" {
  type = string
}

variable "production_public_CIDR" {
  type = string
}

variable "eks_subnet_1" {
  type = string
}

variable "eks_subnet_2" {
  type = string
}

variable "eks_node_group_subnet_1" {
  type = string
}

variable "eks_node_group_subnet_2" {
  type = string
}

variable "production_public_subnet_1" {
  type = string
}

variable "production_public_subnet_2" {
  type = string
}

variable "eks_subnet_1_name" {
  type = string
}

variable "eks_subnet_2_name" {
  type = string
}

variable "eks_node_group_subnet_1_name" {
  type = string
}

variable "eks_node_group_subnet_2_name" {
  type = string
}

variable "production_public_subnet_1_name" {
  type = string
}

variable "production_public_subnet_2_name" {
  type = string
}

variable "production_nat_gateway_name" {
  type = string
}

variable "eks_node_instance_type" {
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