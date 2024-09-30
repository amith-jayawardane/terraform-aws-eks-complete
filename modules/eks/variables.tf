variable "eks_cluster_name" {
  type = string
}

variable "eks_iam_role_arn" {
  type = string
}

variable "eks_iam_node_group_role_arn" {
  type = string
}

variable "eks_iam_pod_identity_association_role_arn" {
  type = string
}

variable "eks_iam_pod_identity_association_elb_controller_role_arn" {
  type = string
}

variable "eks_subnet_1_id" {
  type = string
}

variable "eks_subnet_2_id" {
  type = string
}

variable "eks_node_group_subnet_1_id" {
  type = string
}

variable "eks_node_group_subnet_2_id" {
  type = string
}

variable "eks_cluster_security_group_id" {
  type = string
}

variable "jump_server_role_arn" {
  type = string
}

variable "eks_node_instance_type" {
  type = string
}