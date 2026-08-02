resource "aws_internet_gateway" "oregon_public" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-igw"
  }
}
