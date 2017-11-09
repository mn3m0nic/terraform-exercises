# Lesson 01
# --
# This example will install simple VM with t2.micro and Debian
# And allow SSH access via public IP on port 22
# --
provider "aws" {
  region     = "eu-central-1"
}
resource "aws_instance" "lesson01" {
  ami = "ami-0b0bac64"
  instance_type = "t2.micro"
  tags {
    Name = "Lesson 01 - test instance. SSH access."
  }
  provisioner "local-exec" {
    command = "echo ${aws_instance.lesson01.public_ip} > ip_address.txt"
  }
  key_name = "${aws_key_pair.dev.key_name}"
  security_groups = ["public"]
}
