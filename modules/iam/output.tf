output "eks_iam_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "eks_iam_node_group_role_arn" {
  value = aws_iam_role.eks-node-group-role.arn
}

output "eks_iam_pod_identity_association_role_arn" {
  value = aws_iam_role.eks_pod_identity_role.arn
}

output "eks_iam_pod_identity_association_elb_controller_role_arn" {
  value = aws_iam_role.eks_pod_identity_role_elb_controller.arn
}

output "jump_server_role_name" {
  value = aws_iam_role.jump_server_role.name
}

output "jump_server_role_arn" {
  value = aws_iam_role.jump_server_role.arn
}
