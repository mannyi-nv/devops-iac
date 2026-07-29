resource "aws_route" "virginia_public_to_oregon" {
  provider                  = aws.us-east-1
  route_table_id            = aws_route_table.virginia_public_rt.id 
  destination_cidr_block    = "10.20.0.0/24"
  vpc_peering_connection_id = aws_vpc_peering_connection.main_to_second.id
}


