resource "aws_route_table" "n_virginia_private" {
  provider = aws.n_virginia
  vpc_id   = aws_vpc.second-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.n_virginia_nat.id
  }

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Private-RT"
  }
}

resource "aws_route_table_association" "n_virginia_private" {
  provider       = aws.n_virginia
  count          = var.private_subnet_counts
  subnet_id      = aws_subnet.n_virginia-private-subnet[count.index].id
  route_table_id = aws_route_table.n_virginia_private.id
}

