resource "aws_eip" "oregon_nat" {
  domain = "vpc"

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "oregon_nat" {
  allocation_id = aws_eip.oregon_nat.id
  subnet_id     = aws_subnet.oregon-public-subnet[0].id

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-nat"
  }

  depends_on = [aws_internet_gateway.oregon_public]
}
