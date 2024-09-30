data "aws_ssm_parameter" "eks_ami_release_version" {
  name = "/aws/service/eks/optimized-ami/${aws_eks_cluster.production-eks.version}/amazon-linux-2/recommended/release_version"
}

resource "aws_eks_node_group" "production-eks-node-group" {
  cluster_name    = aws_eks_cluster.production-eks.name
  node_group_name = "production-eks-node-group"
  version         = aws_eks_cluster.production-eks.version
  release_version = nonsensitive(data.aws_ssm_parameter.eks_ami_release_version.value)
  node_role_arn   = var.eks_iam_node_group_role_arn
  subnet_ids      = [var.eks_node_group_subnet_1_id, var.eks_node_group_subnet_1_id]
  instance_types  = [var.eks_node_instance_type]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}