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

# Assign region variable for AWS provider

variable "main_region" {
  # Value here will be filled by terraform.tfvars file
  default = ""
}

variable "secondary_region" {
  # Value here will be filled by terraform.tfvars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "vpc_cidr_block" {
  default = "172.16.0.0/16"
}

# Assign cidr variable for vpc resource
variable "vpc_dev_cidr_block" {
  # Value here will be filled by 2_dev.autovars file
  default = ""
}

# Assign cidr variable for vpc resource
variable "vpc_prod_cidr_block" {
  # Value here will be filled by 1_prod.autovars file
  default = ""
}

# Assign subnet_count variable for subnet resource
variable "subnet_counts" {
  type    = number
  default = 2
}

variable "env_name" {
  type    = string
  default = ""
}

variable "dev_env_type" {
  type    = string
  default = "dev"
}

variable "instance_type" {
  # Value here will be filled by terraform.tfvars file
  default = ""
}

variable "subnet_prod" {
  # Value here will be filled by 1_prod.autovars file
  default = ""
}

variable "subnet_dev" {
  # Value here will be filled by 2_dev.autovars file
  default = ""
}

variable "public_subnet" {
  default = "10.20.50.0/24"
}

variable "private_subnet" {
  # Value here will be filled by subnet-private.tf file
  type    = string
  default = ""
}


