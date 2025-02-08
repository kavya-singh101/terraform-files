data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]


}

# security group
data "aws_security_group" "name" {
  tags = {
    mywebserver="http" 
  }
}

data "aws_vpc" "name" {
  tags = {
    Name = "my-VPC"
  }
}

# AZ
data "aws_availability_zones" "available" {
  state = "available"
}

# get the account name
data "aws_caller_identity" "name" {

}

# aws region
data "aws_region" "current" {

}