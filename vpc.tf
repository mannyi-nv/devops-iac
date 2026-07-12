# resource "aws_vpc" "vpc_1" {
#     cidr_block = var.vpc_cidr_block

#     tags = {
#         Name = "US-west-2"
#     }
# }

# resource "aws_vpc" "vpc_2" {
#     provider = aws.us-east-1
#     cidr_block = var.vpc_cidr_block

#     tags = {
#         Name = "US-east-1"
#     }
# }