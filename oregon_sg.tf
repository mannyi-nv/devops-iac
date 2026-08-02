resource "aws_security_group" "oregon_allow_public_rdp_sg" {
  name        = "${var.env_type}-${var.oregon_region}-${var.env_name}-allow_rdp_sg"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-allow_rdp_sg"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "oregon_allow_private_rdp_ssh_http_sg" {
  name        = "${var.env_type}-${var.oregon_region}-${var.env_name}-allow_rdp_ssh_http_sg"
  description = "Allow RDP, SSH, and HTTP inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-allow_rdp_ssh_http_sg"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.20.50.0/24"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.20.50.0/24"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.20.50.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

