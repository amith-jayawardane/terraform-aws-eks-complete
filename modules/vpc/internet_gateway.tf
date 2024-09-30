resource "aws_internet_gateway" "production_internet_gateway" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {
    Name = "production_internet_gw"
    Environment = "production"
  }
}