resource "aws_route" "virginia_public_to_oregon" {
  provider                  = aws.us-east-1
  route_table_id            = aws_route_table.n_virginia_public.id
  destination_cidr_block    = var.oregon_vpc_dev_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main_to_second.id
}


