terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.5"
    }
  }
}


# Configure the AWS Provider
provider "aws" {
  region     = var.main_region
  access_key = var.key
  secret_key = var.secret
  token      = var.token
}

provider "aws" {
  alias      = "us-east-1"
  region     = var.secondary_region
  access_key = var.key
  secret_key = var.secret
  token      = var.token
}




