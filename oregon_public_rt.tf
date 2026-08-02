resource "aws_route_table" "oregon_public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.oregon_public.id
  }

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Public-RT"
  }
}

resource "aws_route_table_association" "oregon_public" {
  count          = var.public_subnet_counts
  subnet_id      = aws_subnet.oregon-public-subnet[count.index].id
  route_table_id = aws_route_table.oregon_public.id
}