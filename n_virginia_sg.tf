resource "aws_security_group" "n_virginia_allow_public_rdp_sg" {
  provider    = aws.n_virginia
  name        = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-allow_rdp_sg"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.second-vpc.id

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-allow_rdp_sg"
  }

  ingress {
    from_port = 3389
    to_port   = 3389
    protocol  = "tcp"
    cidr_blocks = [
      "${aws_instance.oregon-EC2-1-public.public_ip}/32"
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "n_virginia_allow_public_ssh_http_sg" {
  provider    = aws.n_virginia
  name        = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-allow_ssh_http_sg"
  description = "Allow SSH, and HTTP inbound traffic"
  vpc_id      = aws_vpc.second-vpc.id

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-allow_ssh_http_sg"
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
