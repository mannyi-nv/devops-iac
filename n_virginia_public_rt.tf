resource "aws_route_table" "n_virginia_public" {
  provider = aws.n_virginia
  vpc_id   = aws_vpc.second-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.n_virginia_public.id
  }

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Public-RT"
  }
}

resource "aws_route_table_association" "n_virginia_public" {
  provider       = aws.n_virginia
  count          = var.public_subnet_counts
  subnet_id      = aws_subnet.n_virginia-public-subnet[count.index].id
  route_table_id = aws_route_table.n_virginia_public.id
}
