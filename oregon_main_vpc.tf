resource "aws_vpc" "main-vpc" {
  cidr_block = local.oregon_vpc_cidr_block
  tags = {
    Name = "${var.env_type}-${var.oregon_region}-${var.env_name}-VPC"
    Env  = var.env_name
  }
}
