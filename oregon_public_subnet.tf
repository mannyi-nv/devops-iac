resource "aws_subnet" "ORG-public-subnet" {
  count             = var.public_subnet_counts
  vpc_id            = aws_vpc.main-vpc.id
  availability_zone = var.org_use2_zone_a
  cidr_block        = cidrsubnet(var.oregon_vpc_dev_cidr_block, 8, 50 + count.index)

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-Public-Subnet"

  }
}

resource "aws_internet_gateway" "oregon_public" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-igw"
  }
}

resource "aws_eip" "oregon_nat" {
  domain = "vpc"

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "oregon_nat" {
  allocation_id = aws_eip.oregon_nat.id
  subnet_id     = aws_subnet.ORG-public-subnet[0].id

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-nat"
  }

  depends_on = [aws_internet_gateway.oregon_public]
}

resource "aws_route_table" "oregon_public" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.oregon_public.id
  }

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-Public-RT"

  }
}

resource "aws_route_table_association" "oregon_public" {
  count          = var.public_subnet_counts
  subnet_id      = aws_subnet.ORG-public-subnet[count.index].id
  route_table_id = aws_route_table.oregon_public.id
}
