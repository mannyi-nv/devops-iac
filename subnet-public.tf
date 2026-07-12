resource "aws_subnet" "public-subnet" {
  count      = var.subnet_counts
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = cidrsubnet(var.vpc_dev_cidr_block, 8, 50 + count.index)

  tags = {
    Name = "${var.dev_env_type}-${var.main_region}-${var.env_name}-Public-Subnet"

  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.main_region}-${var.env_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public.id
  }

  tags = {
    Name = "${var.dev_env_type}-${var.main_region}-${var.env_name}-Public-RT"

  }
}

resource "aws_route_table_association" "public" {
  count          = var.subnet_counts
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public.id
}
