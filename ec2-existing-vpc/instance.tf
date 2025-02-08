resource "aws_instance" "name" {
  ami             = "ami-00bb6a80f01f03502"
  instance_type   = "t2.micro"
  security_groups = [data.aws_security_group.name.id]
  subnet_id       = data.aws_subnet.name.id

  tags = {
    Name = "my-server"
  }
}
