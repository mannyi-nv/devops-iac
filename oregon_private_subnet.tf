resource "aws_subnet" "oregon_private" {
  count             = var.private_subnet_counts
  vpc_id            = aws_vpc.main-vpc.id
  availability_zone = var.org_use2_zone_a
  cidr_block        = cidrsubnet(var.oregon_vpc_dev_cidr_block, 8, 101 + count.index)

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-Private-${count.index + 101}-Subnet"
  }
}

resource "aws_route_table" "oregon_private" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.oregon_nat.id
  }

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-Private-RT"
  }
}

resource "aws_route_table_association" "oregon_private" {
  count          = var.private_subnet_counts
  subnet_id      = aws_subnet.oregon_private[count.index].id
  route_table_id = aws_route_table.oregon_private.id
}

