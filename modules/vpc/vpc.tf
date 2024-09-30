resource "aws_vpc" "production_vpc" {
  cidr_block = "172.10.10.0/24" 
  enable_dns_hostnames = "true"
  
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "eks_cidr" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = var.eks_cidr
}

resource "aws_vpc_ipv4_cidr_block_association" "eks_node_group_cidr" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = var.eks_node_group_cidr
}

resource "aws_vpc_ipv4_cidr_block_association" "production_public_CIDR" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = var.production_public_CIDR
}