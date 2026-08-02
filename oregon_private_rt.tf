resource "aws_route_table" "oregon_private" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.oregon_nat.id
  }

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Private-RT"
  }
}

resource "aws_route_table_association" "oregon_private" {
  count          = var.private_subnet_counts
  subnet_id      = aws_subnet.oregon-private-subnet[count.index].id
  route_table_id = aws_route_table.oregon_private.id
}