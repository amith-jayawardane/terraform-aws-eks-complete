# EKS subnets
resource "aws_subnet" "eks_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = var.eks_subnet_1
  availability_zone = var.az1

  tags = {
    Name = var.eks_subnet_1_name
    Environment = "production"
  }
}

resource "aws_subnet" "eks_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_cidr.vpc_id
  cidr_block = var.eks_subnet_2
  availability_zone = var.az2

  tags = {
    Name = var.eks_subnet_2_name
    Environment = "production"
  }
}

# EKS EC2 node group subnets
resource "aws_subnet" "eks_node_group_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_node_group_cidr.vpc_id
  cidr_block = var.eks_node_group_subnet_1
  availability_zone = var.az1

  tags = {
    Name = var.eks_node_group_subnet_1_name
    Environment = "production"
  }
}

resource "aws_subnet" "eks_node_group_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.eks_node_group_cidr.vpc_id
  cidr_block = var.eks_node_group_subnet_2
  availability_zone = var.az2

  tags = {
    Name = var.eks_node_group_subnet_2_name
    Environment = "production"
  }
}

# Public subnets
resource "aws_subnet" "production_public_subnet_1" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.production_public_CIDR.vpc_id
  cidr_block = var.production_public_subnet_1
  availability_zone = var.az1

  tags = {
    Name = var.production_public_subnet_1_name
    Environment = "production"
  }
}

resource "aws_subnet" "production_public_subnet_2" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.production_public_CIDR.vpc_id
  cidr_block = var.production_public_subnet_2
  availability_zone = var.az2

  tags = {
    Name = var.production_public_subnet_2_name
    Environment = "production"
  }
}