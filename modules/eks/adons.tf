resource "aws_eks_addon" "eks-vpc-cni" {
  cluster_name = aws_eks_cluster.production-eks.name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name = aws_eks_cluster.production-eks.name
  addon_name   = "kube-proxy"
}

resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.production-eks.name
  addon_name   = "coredns"
}

resource "aws_eks_addon" "eks-pod-identity-agent" {
  cluster_name = aws_eks_cluster.production-eks.name
  addon_name   = "eks-pod-identity-agent"
}
