resource "aws_eks_cluster" "production-eks" {
  name     = var.eks_cluster_name
  role_arn = var.eks_iam_role_arn
  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    subnet_ids = [var.eks_subnet_1_id, var.eks_subnet_2_id]
    security_group_ids = [var.eks_cluster_security_group_id]
    endpoint_private_access = true
    endpoint_public_access  = false
  }

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }
}

resource "aws_eks_access_entry" "eks_access_entry" {
  cluster_name      = aws_eks_cluster.production-eks.name
  principal_arn     = var.jump_server_role_arn
  type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "access_policy_associatation" {
  cluster_name  = aws_eks_cluster.production-eks.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.jump_server_role_arn

  access_scope {
    type       = "cluster"
  }
}