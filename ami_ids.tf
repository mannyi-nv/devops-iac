
locals {
  ami_ids = {
    "us-west-2" = {
      linux   = "ami-096f5760b00bcd95c"
      windows = "ami-0b5d53857b130a211"
    }

    "us-east-1" = {
      linux   = "ami-0b6d9d3d33ba97d99"
      windows = "ami-0ed0165f19a049904"
    }
  }
}

