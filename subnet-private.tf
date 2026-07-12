resource "aws_subnet" "private-subnet" {
  count      = var.subnet_counts
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = cidrsubnet(var.vpc_dev_cidr_block, 8, 101 + count.index)

  tags = {
    Name = "${var.dev_env_type}-${var.main_region}-${var.env_name}-Private-${count.index + 101}-Subnet"
  }
}

