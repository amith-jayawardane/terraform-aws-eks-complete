resource "aws_eks_pod_identity_association" "s3_access" {
  cluster_name    = aws_eks_cluster.production-eks.name
  namespace       = "production"
  service_account = "s3-full-access"
  role_arn        = var.eks_iam_pod_identity_association_role_arn
}

resource "aws_eks_pod_identity_association" "aws_lb_controller" {
  cluster_name    = aws_eks_cluster.production-eks.name
  namespace       = "kube-system"
  service_account = "aws-load-balancer-controller"
  role_arn        = var.eks_iam_pod_identity_association_elb_controller_role_arn
}