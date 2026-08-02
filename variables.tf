# Variables for AWS provider and resources
# Used in both regions: Oregon and N_Virginia
# ============================================== #


variable "key" {
  type      = string
  sensitive = true # Recommended for secrets
}

variable "secret" {
  type      = string
  sensitive = true # Recommended for secrets
}

variable "token" {
  type      = string
  sensitive = true # Recommended for tokens
}

# Assign subnet_count variable for subnet resource
variable "public_subnet_counts" {
  type    = number
  default = 4
}

# Assign subnet_count variable for subnet resource
variable "private_subnet_counts" {
  type    = number
  default = 5
}

variable "instance_type" {
  # Value here will be filled by terraform.tfvars file
  default = ""
}

variable "env_name" {
  type    = string
  default = ""
}

variable "env_type" {
  type    = string
  default = "dev"
}

variable "prod_env_type" {
  type    = string
  default = "prod"
}

variable "test_env_type" {
  type    = string
  default = "test"
}

# Assign cidr variable for vpc resource
variable "vpc_cidr_block" {
  default = "172.16.0.0/16"
}

# Assign region variable for AWS provider

# Oregon region
# ============================================== #

variable "oregon_region" {
  # Value here will be filled by terraform.tfvars file
  type    = string
  default = ""
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_dev_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_prod_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_test_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

variable "oregon_key_name" {
  default = "us-west-2"
}

variable "oregon_subnet_prod" {
  # Value here will be filled by autovars file
  default = ""
}

variable "oregon_subnet_dev" {
  # Value here will be filled by autovars file
  default = ""
}

variable "oregon_subnet_test" {
  # Value here will be filled by autovars file
  default = ""
}

variable "oregon_private_subnet" {
  # Value here will be filled by oregon_private_subnet.tf file
  type    = string
  default = ""
}

variable "oregon_usw2_zone_a" {
  # Value here will be filled by terraform.tfvars file
  type    = string
  default = "us-west-2a"
}

# # N_Virginia region
# # ============================================== #

variable "n_virginia_region" {
  # Value here will be filled by terraform.tfvars file
  type    = string
  default = ""
}

variable "vrg_use1_zone_a" {
  # Value here will be filled by terraform.tfvars file
  type    = string
  default = "us-east-1a"
}

variable "vrg_key_name" {
  default = "us-east-1"
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_dev_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_prod_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_test_cidr_block" {
  # Value here will be filled by autovars file
  default = ""
}

variable "n_virginia_subnet_prod" {
  # Value here will be filled by autovars file
  default = ""
}

variable "n_virginia_subnet_dev" {
  # Value here will be filled by autovars file
  default = ""
}

variable "n_virginia_subnet_test" {
  # Value here will be filled by autovars file
  default = ""
}

variable "n_virginia_private_subnet" {
  # Value here will be filled by n_virginia_private_subnet.tf file
  type    = string
  default = ""
}

locals {
  oregon_vpc_cidr_block = lookup({
    dev  = var.oregon_vpc_dev_cidr_block
    prod = var.oregon_vpc_prod_cidr_block
    test = var.oregon_vpc_test_cidr_block
  }, var.env_type, var.oregon_vpc_dev_cidr_block)

  n_virginia_vpc_cidr_block = lookup({
    dev  = var.n_virginia_vpc_dev_cidr_block
    prod = var.n_virginia_vpc_prod_cidr_block
    test = var.n_virginia_vpc_test_cidr_block
  }, var.env_type, var.n_virginia_vpc_dev_cidr_block)
}

