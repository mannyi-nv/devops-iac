resource "aws_route" "oregon_public_to_virginia" {
  provider                  = aws.us-west-2
  route_table_id            = aws_route_table.oregon_public.id
  destination_cidr_block    = "10.21.0.0/24"                       # Virginia CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.main_to_second.id
}

