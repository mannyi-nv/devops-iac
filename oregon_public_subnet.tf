resource "aws_subnet" "oregon-public-subnet" {
  availability_zone = var.oregon_usw2_zone_a
  count             = var.public_subnet_counts
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = cidrsubnet(local.oregon_vpc_cidr_block, 8, 50 + count.index)

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Public-Subnet"

  }
}
