locals {
  oregon_public_cidrs = [for i in range(var.public_subnet_counts) : cidrsubnet(var.oregon_vpc_dev_cidr_block, 8, 50 + i)]
  n_virginia_public_cidrs = [for i in range(var.public_subnet_counts) : cidrsubnet(var.n_virginia_vpc_dev_cidr_block, 8, 50 + i)]
}
