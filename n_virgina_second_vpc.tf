resource "aws_vpc" "second-vpc" {
  provider   = aws.n_virginia
  cidr_block = local.n_virginia_vpc_cidr_block
  tags = {
    Name = "${var.env_type}-${var.n_virginia_region}-${var.env_name}-VPC"
    Env  = var.env_name
  }
}
