resource "aws_subnet" "n_virginia-public-subnet" {
  provider          = aws.n_virginia
  availability_zone = var.vrg_use1_zone_a
  count             = var.public_subnet_counts
  vpc_id            = aws_vpc.second-vpc.id
  cidr_block        = cidrsubnet(local.n_virginia_vpc_cidr_block, 8, 50 + count.index)

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Public-Subnet"

  }
}

