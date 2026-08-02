
locals {
  ami_ids = {
    "us-east-1" = {
      linux   = "ami-0f8a61b66d1accaee"
      windows = "ami-0ed0165f19a049904"
    }

    "us-west-2" = {
      linux   = "ami-096f5760b00bcd95c"
      windows = "ami-037613a54b9f6541a"
    }
  }
}

