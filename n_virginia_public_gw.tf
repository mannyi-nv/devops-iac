resource "aws_internet_gateway" "n_virginia_public" {
  provider = aws.n_virginia
  vpc_id   = aws_vpc.second-vpc.id

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-igw"
  }
}