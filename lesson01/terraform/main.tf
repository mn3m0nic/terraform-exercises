# Lesson 01
provider "aws" {
  region     = "eu-central-1"
}
resource "aws_instance" "example" {
  ami = "ami-0b0bac64"
  instance_type = "t2.micro"
  tags {
    Name = "Lesson 01 - test EC2 instance - Debian"
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
