resource "aws_security_group" "nginx-sg" {
    vpc_id = aws_vpc.my-VPC.id
    ingress {  # inbound traffic for http
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {  # outbound traffic
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # applicable on all protocols
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "nginx-sg"
    }
}