# Route traffic out of Main VPC (us-west-2) into the Peering Connection
resource "aws_route" "main_to_second" {
  provider                  = aws.us-west-2
  route_table_id            = aws_route_table.main_route_table.id # Your Main RT ID
  destination_cidr_block    = "10.21.0.0/24"                      # Target Second VPC CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.west_to_east.id
}

# Route traffic out of Second VPC (us-east-1) back into the Peering Connection
resource "aws_route" "second_to_main" {
  provider                  = aws.us-east-1
  route_table_id            = aws_route_table.oregon_private.id   # Your Second RT ID
  destination_cidr_block    = "10.20.0.0/24"                      # Return Main VPC CIDR
  vpc_peering_connection_id = aws_vpc_peering_connection.west_to_east.id
}

