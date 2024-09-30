resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.production_vpc.id
  service_name = "com.amazonaws.${var.region}.s3"
}