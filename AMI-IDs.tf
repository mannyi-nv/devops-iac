locals {
  ami_ids = {
    "us-west-2" = {
      linux   = "ami-096f5760b00bcd95c" 
      windows = "ami-0b5d53857b130a211" 
    }

    "us-east-1" = {
      linux   = "ami-0f8a61b66d1accaee" 
      windows = "ami-0ab5e8edee718de14" 
    }
  }
}
