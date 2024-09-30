output "production-eks-endpoint" {
  value = aws_eks_cluster.production-eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.production-eks.certificate_authority[0].data
}

output "eks-cluster-name" {
  value = aws_eks_cluster.production-eks.name
}

output "eks_cluster_version" {
  value = aws_eks_cluster.production-eks.version
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.production-eks.endpoint
}