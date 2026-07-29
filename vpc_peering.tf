resource "aws_vpc_peering_connection" "main_to_second" {
  provider    = aws.us-west-2
  vpc_id      = aws_vpc.main-vpc.id
  peer_vpc_id = aws_vpc.second-vpc.id
  peer_region = "us-east-1"
  auto_accept = false

  tags = {
    Name = "${var.env_name}-oregon-to-virginia-peer"
  }
}

resource "aws_vpc_peering_connection_accepter" "main_to_second" {
  provider                 = aws.us-east-1
  vpc_peering_connection_id = aws_vpc_peering_connection.main_to_second.id
  auto_accept              = true

  tags = {
    Name = "${var.env_name}-virginia-to-oregon-peer-accepter"
  }
}

