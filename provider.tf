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
  region     = "us-west-2"
  access_key = var.key
  secret_key = var.secret
  token      = var.token
}

provider "aws" {

  alias  = "n_virginia"
  region = "us-east-1"

  access_key = var.key
  secret_key = var.secret
  token      = var.token
}




