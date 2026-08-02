resource "aws_instance" "oregon-EC2-1-private-windows" {
  ami                         = local.ami_ids.us-west-2.windows
  availability_zone           = var.oregon_usw2_zone_a
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.oregon-private-subnet[0].id
  key_name                    = var.oregon_key_name
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.oregon_allow_private_rdp_ssh_http_sg.id]

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Private-Win"
  }
}

resource "aws_instance" "oregon-EC2-2-private-linux" {
  ami                         = local.ami_ids.us-west-2.linux
  availability_zone           = var.oregon_usw2_zone_a
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.oregon-private-subnet[0].id
  key_name                    = var.oregon_key_name
  user_data_replace_on_change = true
  vpc_security_group_ids      = [aws_security_group.oregon_allow_private_rdp_ssh_http_sg.id]

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Private-Linux"
  }
}



