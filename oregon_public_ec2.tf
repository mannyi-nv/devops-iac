resource "aws_instance" "ORG-EC2-1-public" {
  ami                         = local.ami_ids.us-west-2.windows
  availability_zone           = aws_subnet.ORG-public-subnet[0].availability_zone
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.ORG-public-subnet[0].id
  key_name                    = var.org_key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.oregon_allow_public_rdp_sg.id]
  #   aws_security_group.oregon_allow_public_http_sg.id,
  # aws_security_group.oregon_allow_public_ssh_sg.id]

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-Public-Win"
  }
}

resource "aws_security_group" "oregon_allow_public_rdp_sg" {
  name        = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_rdp_sg"
  description = "Allow RDP inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id

  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_rdp_sg"
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

#     # Configure security groups to be use in private subnet for allowing ssh and HTTP traffic from public subnet

# resource "aws_security_group" "oregon_allow_public_ssh_sg" {
#     name        = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_ssh_sg"
#     description = "Allow SSH inbound traffic"
#     vpc_id      = aws_vpc.main-vpc.id

#     tags = {
#       Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_ssh_sg"
#     }

#     ingress {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }

#     egress {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#     }

# }

# resource "aws_security_group" "oregon_allow_public_http_sg" {
#     name        = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_http_sg"
#     description = "Allow HTTP inbound traffic"
#     vpc_id      = aws_vpc.main-vpc.id

#     tags = {
#       Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-allow_http_sg"
#     }

#     ingress {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }

# }
