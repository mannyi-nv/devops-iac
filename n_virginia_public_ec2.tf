resource "aws_instance" "VRG-EC2-1-public" {
  provider                    = aws.n_virginia
  ami                         = local.ami_ids.us-east-1.windows
  availability_zone           = var.vrg_use1_zone_a
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.n_virginia-public-subnet[0].id
  key_name                    = var.vrg_key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.n_virginia_allow_public_rdp_sg.id]

  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-Public-Win"
  }
}
