terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-server" {
  ami           = data.aws_ami.name.id
  instance_type = "t2.micro"
  tags = {
    Name = "my-server"
  }
}
