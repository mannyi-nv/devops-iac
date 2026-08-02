resource "aws_subnet" "oregon-private-subnet" {
  availability_zone = var.oregon_usw2_zone_a
  count             = var.private_subnet_counts
  vpc_id            = aws_vpc.main-vpc.id
  cidr_block        = cidrsubnet(local.oregon_vpc_cidr_block, 8, 101 + count.index)

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Private-${count.index + 101}-Subnet"
  }
}


