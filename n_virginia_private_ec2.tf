resource "aws_instance" "VRG-EC2-1-private-windows" {
  provider          = aws.n_virginia
  ami               = local.ami_ids.us-east-1.windows
  availability_zone = aws_subnet.n_virginia-private-subnet[0].availability_zone
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.n_virginia-private-subnet[0].id
  key_name          = var.vrg_key_name

  # associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.n_virginia_allow_public_rdp_sg.id]

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Private-Win"
  }
}

resource "aws_instance" "VRG-EC2-2-private-linux" {
  provider          = aws.n_virginia
  ami               = local.ami_ids.us-east-1.linux
  availability_zone = aws_subnet.n_virginia-private-subnet[0].availability_zone
  instance_type     = var.instance_type
  subnet_id         = aws_subnet.n_virginia-private-subnet[0].id
  key_name          = var.vrg_key_name

  # associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.n_virginia_allow_public_ssh_http_sg.id]

  depends_on = [aws_nat_gateway.n_virginia_nat]

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Private-Linux"
  }
}

