resource "aws_vpc" "my-VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-VPC"
  }
}

# Create a private Subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.my-VPC.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
    tags = {
        Name = "private-subnet"
    }
}

# Create a public Subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.my-VPC.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
    tags = {
        Name = "public-subnet"
    }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my-IGW" {
  vpc_id = aws_vpc.my-VPC.id
  tags = {
    Name = "my-IGW"
  }
}

# Create a Route Table
resource "aws_route_table" "my-RT" {
  vpc_id = aws_vpc.my-VPC.id

#   dont use '=' in route block
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-IGW.id
    }
    tags = {
        Name = "my-RT"
    }
}

# Associate the Route Table with the public subnet
resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my-RT.id
  subnet_id      = aws_subnet.public-subnet.id
}