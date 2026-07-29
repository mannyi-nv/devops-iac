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

variable "public_subnet" {
  default = "10.20.50.0/24"
}

# Assign subnet_count variable for subnet resource
variable "public_subnet_counts" {
  type    = number
  default = 0
}

# Assign subnet_count variable for subnet resource
variable "private_subnet_counts" {
  type    = number
  default = 0
}

variable "instance_type" {
  # Value here will be filled by terraform.tfvars file
  default = ""
}

variable "env_name" {
  type    = string
  default = ""
}

variable "dev_env_type" {
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

# Assign region variable for AWS provider

# Oregon region
# ============================================== #

variable "Oregon_region" {
  # Value here will be filled by terraform.tfvars file
  type      = string
  default = ""
}

# Assign cidr variable for vpc resource
variable "vpc_cidr_block" {
  default = "172.16.0.0/16"
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_dev_cidr_block" {
  # Value here will be filled by 3_dev.autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_prod_cidr_block" {
  # Value here will be filled by 1_prod.autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "oregon_vpc_test_cidr_block" {
  # Value here will be filled by 2_test.autovars file
  default = ""
}

variable "org_key_name" {
  default = "us-west-2"
}

variable "oregon_subnet_prod" {
  # Value here will be filled by 1_oregon_prod.autovars file
  default = ""
}

variable "oregon_subnet_dev" {
  # Value here will be filled by 2_oregon_dev.autovars file
  default = ""
}

variable "oregon_subnet_test" {
  # Value here will be filled by 2_oregon_test.autovars file
  default = ""
}

variable "oregon_private_subnet" {
  # Value here will be filled by oregon_private_subnet.tf file
  type    = string
  default = ""
}

# # N_Virginia region
# # ============================================== #

variable "n_virginia_region" {
  # Value here will be filled by terraform.tfvars file
  type      = string
  default = ""
}

variable "vrg_use1_zone_a" {
  # Value here will be filled by terraform.tfvars file
  type    = string
  default = "us-east-1a"
}

variable "org_use2_zone_a" {
  type    = string
  default = "us-west-2a"
}

variable "vrg_key_name" {
  default = "us-east-1"
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_dev_cidr_block" {
  # Value here will be filled by 3_n_virginia_dev.autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_prod_cidr_block" {
  # Value here will be filled by 1_n_virginia_prod.autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "n_virginia_vpc_test_cidr_block" {
  # Value here will be filled by 2_n_virginia_test.autovars file
  default = ""
}

variable "n_virginia_subnet_prod" {
  # Value here will be filled by 1_n_virginia_prod.autovars file
  default = ""
}

variable "n_virginia_subnet_dev" {
  # Value here will be filled by 3_n_virginia_dev.autovars file
  default = ""
}

variable "n_virginia_subnet_test" {
  # Value here will be filled by 2_n_virginia_test.autovars file
  default = ""
}

variable "n_virginia_private_subnet" {
  # Value here will be filled by n_virginia_private_subnet.tf file
  type    = string
  default = ""
}

