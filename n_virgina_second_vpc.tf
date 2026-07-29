resource "aws_vpc" "second-vpc" {
  provider   = aws.us-east-1
  cidr_block = var.n_virginia_vpc_dev_cidr_block
  tags = {
    Name = "${var.dev_env_type}-${var.n_virginia_region}-${var.env_name}-VPC"
    Env  = var.env_name
  }
}
