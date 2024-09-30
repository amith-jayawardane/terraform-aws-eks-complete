resource "aws_nat_gateway" "production_nat_gateway" {
  allocation_id = aws_eip.production_nat_eip.id
  subnet_id     = aws_subnet.production_public_subnet_1.id

  tags = {
    Name = "production_nat_gw"
    Environment = "production"
  }

  depends_on = [aws_internet_gateway.production_internet_gateway]
}

resource "aws_eip" "production_nat_eip" {
  domain = "vpc"
}