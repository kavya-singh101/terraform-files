# AMI output
output "aws_ami" {
  value = data.aws_ami.name.id
}

# security group output
output "aws_security_group" {
  value = data.aws_security_group.name.id
}

# VPC output
output "aws_vpc" {
  value = data.aws_vpc.name.id
}

# AZ output
output "aws_availability_zones" {
  value = data.aws_availability_zones.available.names
}

# account name output
output "aws_caller_identity" {
  value = data.aws_caller_identity.name
}

# region output
output "aws_region" {
  value = data.aws_region.current.name
}