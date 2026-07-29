resource "aws_vpc" "main-vpc" {
  cidr_block = var.oregon_vpc_dev_cidr_block
  tags = {
    Name = "${var.dev_env_type}-${var.Oregon_region}-${var.env_name}-VPC"
    Env  = var.env_name
  }
}
