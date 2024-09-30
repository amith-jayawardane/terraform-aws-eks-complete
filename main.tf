module "production_vpc" {
  source = "./modules/vpc"
  region = var.region
  vpc_name = var.vpc_name
  eks_cidr = var.eks_cidr
  eks_node_group_cidr = var.eks_node_group_cidr
  production_public_CIDR = var.production_public_CIDR
  eks_subnet_1 = var.eks_subnet_1
  eks_subnet_2 = var.eks_subnet_2
  eks_node_group_subnet_1 = var.eks_node_group_subnet_1
  eks_node_group_subnet_2 = var.eks_node_group_subnet_2
  production_public_subnet_1 = var.production_public_subnet_1
  production_public_subnet_2 = var.production_public_subnet_2
  eks_subnet_1_name = var.eks_subnet_1_name
  eks_subnet_2_name = var.eks_subnet_2_name
  eks_node_group_subnet_1_name = var.eks_node_group_subnet_1_name
  eks_node_group_subnet_2_name = var.eks_node_group_subnet_2_name
  production_public_subnet_1_name = var.production_public_subnet_1_name
  production_public_subnet_2_name = var.production_public_subnet_2_name
  az1 = var.az1
  az2 = var.az2
  production_nat_gateway_name = var.production_nat_gateway_name
}

module "iam" {
  source = "./modules/iam"
}

module "production_eks" {
  source = "./modules/eks"
  depends_on = [ module.iam ]
  eks_cluster_name = var.eks_cluster_name
  eks_iam_role_arn = module.iam.eks_iam_role_arn
  eks_iam_node_group_role_arn = module.iam.eks_iam_node_group_role_arn
  eks_iam_pod_identity_association_role_arn = module.iam.eks_iam_pod_identity_association_role_arn
  eks_iam_pod_identity_association_elb_controller_role_arn = module.iam.eks_iam_pod_identity_association_elb_controller_role_arn
  eks_subnet_1_id = module.production_vpc.eks_subnet_1_id
  eks_subnet_2_id = module.production_vpc.eks_subnet_2_id
  eks_node_group_subnet_1_id = module.production_vpc.eks_node_group_subnet_1_id
  eks_node_group_subnet_2_id = module.production_vpc.eks_node_group_subnet_2_id
  eks_cluster_security_group_id = module.production_vpc.eks_cluster_security_group_id
  jump_server_role_arn = module.iam.jump_server_role_arn
  eks_node_instance_type = var.eks_node_instance_type
}

module "jump_server" {
  source = "./modules/ec2"
  depends_on = [ module.production_vpc, module.production_eks ]
  bastian_subnet_id = module.production_vpc.bastian_subnet_id
  allow_ssh_security_group_id = module.production_vpc.allow_ssh_security_group_id
  jump_server_role_name = module.iam.jump_server_role_name
  vpc_id = module.production_vpc.vpc_id
  instance_type = var.instance_type
  jump_server_public_key = var.jump_server_public_key
  jump_server_name = var.jump_server_name
  region = var.region
  eks_cluster_name = var.eks_cluster_name
}