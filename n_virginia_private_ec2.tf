resource "aws_instance" "VRG-EC2-1-private-windows" {
  ami               = local.ami_ids.us-east-1.windows
  availability_zone = aws_subnet.private-subnet[0].availability_zone
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.private-subnet[0].id
  key_name          = var.vrg_key_name
  user_data_replace_on_change = true
  user_data         = local.windows_user_data
  # associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.n_virginia_allow_public_rdp_http_sg.id]

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-Private-Win"
  }
}

resource "aws_security_group" "n_virginia_allow_public_rdp_http_sg" {
  name        = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-private-allow_rdp_sg"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-private-allow_rdp_sg"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.21.50.0/24"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.21.50.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "VRG-EC2-2-private-linux" {
  ami               = local.ami_ids.us-east-1.linux
  availability_zone = aws_subnet.private-subnet[0].availability_zone
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.private-subnet[0].id
  key_name          = var.vrg_key_name
  user_data_replace_on_change = true
  user_data         = local.linux_user_data
    # associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.n_virginia_allow_public_ssh_http_sg.id]

    depends_on = [aws_nat_gateway.n_virginia_nat]

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-Private-Linux"
  }
}

resource "aws_security_group" "n_virginia_allow_public_ssh_http_sg" {
  name        = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-public-allow_ssh_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-public-allow_ssh_sg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.21.50.0/24"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.21.50.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

