output "eks_cluset_name" {
  value = module.production_eks.eks-cluster-name
  description = "eks_cluster_name"
}

output "eks_cluset_endpoint" {
  value = module.production_eks.eks_cluster_endpoint
  description = "eks_cluster_endpoint"
}

output "eks_cluster_version" {
  value = module.production_eks.eks_cluster_version
  description = "eks_cluster_version"
}


output "nat_gateway_public_ip" {
  value = module.production_vpc.nat_gateway_public_ip
  description = "nat_gateway_public_ip"
}

output "jump_server_public_dns" {
  value = module.jump_server.jump_server_public_dns
}

output "public_subnet_1_id" {
  value = module.production_vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.production_vpc.public_subnet_2_id
}
