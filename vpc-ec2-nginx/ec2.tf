resource "aws_instance" "nginxServer" {
  ami                         = "ami-00bb6a80f01f03502"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo systemctl enable nginx
                sudo systemctl start nginx
                echo "<h1>Hello World</h1> <img src='https://aestheticblasphemy.com/static/media/images/archive/maxresdefault.jpg'  width='1000' height='500'>" | sudo tee /var/www/html/index.html > /dev/null
                sudo systemctl restart nginx
                EOF

  tags = {
    Name = "nginxServer"
  }
}
