resource "aws_subnet" "n_virginia-private-subnet" {
  provider          = aws.n_virginia
  availability_zone = var.vrg_use1_zone_a
  count             = var.private_subnet_counts
  vpc_id            = aws_vpc.second-vpc.id
  cidr_block        = cidrsubnet(local.n_virginia_vpc_cidr_block, 8, 101 + count.index)

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Private-${count.index + 101}-Subnet"
  }
}

# resource "aws_route_table" "n_virginia_private" {
#   vpc_id = aws_vpc.second-vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.n_virginia_nat.id
#   }

#   tags = {
#     Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Private-RT"
#   }
# }

# resource "aws_route_table_association" "n_virginia_private" {
#   count          = var.private_subnet_counts
#   subnet_id      = aws_subnet.n_virginia-private-subnet[count.index].id
#   route_table_id = aws_route_table.n_virginia_private.id
# }

