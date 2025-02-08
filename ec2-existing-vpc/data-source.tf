data "aws_vpc" "name" {
  tags = {
    Name = "my-VPC"
  }
}

data "aws_security_group" "name" {
  tags = {
    mywebserver = "http"
  }
}

data "aws_subnet" "name" {
    vpc_id = data.aws_vpc.name.id
#   filter {
#     name   = "vpc_id"
#     values = [data.aws_vpc.name.id]
#   }
  tags = {
    Name = "private-subnet"
  }
}
