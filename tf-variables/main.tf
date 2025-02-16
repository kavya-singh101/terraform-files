terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  owner="ABC"
  name="My-server"
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my-server" {
  ami             = "ami-00bb6a80f01f03502"
  instance_type   = var.aws_instance_type
  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }
  tags = merge(var.additional_tags, {
    Name = "sample-server"
    Owner= local.owner
  })
}