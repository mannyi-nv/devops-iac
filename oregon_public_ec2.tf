resource "aws_instance" "oregon-EC2-1-public" {
  ami                         = local.ami_ids.us-west-2.windows
  availability_zone           = var.oregon_usw2_zone_a
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.oregon-public-subnet[0].id
  key_name                    = var.oregon_key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.oregon_allow_public_rdp_sg.id]

  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-Public-Win"
  }
}