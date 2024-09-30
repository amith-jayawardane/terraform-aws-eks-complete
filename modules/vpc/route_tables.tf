resource "aws_route_table" "production-eks-node-group-rt" {
  vpc_id = aws_vpc.production_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.production_nat_gateway.id
  }

  tags = {
    Name = "production-eks-ng-rt"
  }
}

resource "aws_route_table" "production-eks-rt" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {
    Name = "production-eks-rt"
  }
}

resource "aws_route_table" "production-public-rt" {
  vpc_id = aws_vpc.production_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.production_internet_gateway.id
  }

  tags = {
    Name = "production-public-rt"
  }
}

resource "aws_route_table_association" "rta-1" {
  subnet_id      = aws_subnet.eks_node_group_subnet_1.id
  route_table_id = aws_route_table.production-eks-node-group-rt.id
}

resource "aws_route_table_association" "rta-2" {
  subnet_id      = aws_subnet.eks_node_group_subnet_2.id
  route_table_id = aws_route_table.production-eks-node-group-rt.id
}

resource "aws_route_table_association" "rta-3" {
  subnet_id      = aws_subnet.eks_subnet_1.id
  route_table_id = aws_route_table.production-eks-rt.id
}

resource "aws_route_table_association" "rta-4" {
  subnet_id      = aws_subnet.eks_subnet_2.id
  route_table_id = aws_route_table.production-eks-rt.id
}

resource "aws_route_table_association" "public-rta-nat-gw" {
  route_table_id  = aws_route_table.production-public-rt.id
  subnet_id = aws_subnet.production_public_subnet_1.id
}

resource "aws_route_table_association" "public-rta-bastion-host" {
  route_table_id  = aws_route_table.production-public-rt.id
  subnet_id = aws_subnet.production_public_subnet_2.id
}