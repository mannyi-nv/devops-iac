resource "aws_subnet" "VRG-public-subnet" {
  provider          = aws.us-east-1
  count             = var.public_subnet_counts
  vpc_id            = aws_vpc.second-vpc.id
  availability_zone = var.vrg_use1_zone_a
  cidr_block        = cidrsubnet(var.n_virginia_vpc_dev_cidr_block, 8, 50 + count.index)

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-Public-Subnet"

  }
}

resource "aws_internet_gateway" "n_virginia_public" {
  provider = aws.us-east-1
  vpc_id   = aws_vpc.second-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-igw"
  }
}

resource "aws_eip" "n_virginia_nat" {
  provider = aws.us-east-1
  domain   = "vpc"

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "n_virginia_nat" {
  provider      = aws.us-east-1
  allocation_id = aws_eip.n_virginia_nat.id
  subnet_id     = aws_subnet.VRG-public-subnet[0].id

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-nat"
  }

  depends_on = [aws_internet_gateway.n_virginia_public]
}

resource "aws_route_table" "n_virginia_public" {
  provider = aws.us-east-1
  vpc_id   = aws_vpc.second-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.n_virginia_public.id
  }

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-Public-RT"

  }
}

resource "aws_route_table_association" "n_virginia_public" {
  provider        = aws.us-east-1
  count           = var.public_subnet_counts
  subnet_id       = aws_subnet.VRG-public-subnet[count.index].id
  route_table_id  = aws_route_table.n_virginia_public.id
}
