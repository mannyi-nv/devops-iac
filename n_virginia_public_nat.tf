resource "aws_eip" "n_virginia_nat" {
  provider = aws.n_virginia
  domain   = "vpc"

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "n_virginia_nat" {
  provider      = aws.n_virginia
  allocation_id = aws_eip.n_virginia_nat.id
  subnet_id     = aws_subnet.n_virginia-public-subnet[0].id

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-nat"
  }

  depends_on = [aws_internet_gateway.n_virginia_public]
}

