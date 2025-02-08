output "instance_public_ip" {
    description = "The public ip of the EC2 instance"
  value = aws_instance.nginxServer.public_ip
  
}

output "instance_url" {
  description = "url to access nginx server"
    value = "http://${aws_instance.nginxServer.public_ip}"
}