# main.tf
# --
# Lesson 02
# VM1 - Apache+PHP
# VM2 - MySQL
# --
provider "aws" {
  region     = "eu-central-1"
}
resource "aws_instance" "lesson02-apache" {
  ami = "ami-0b0bac64"
  instance_type = "t2.micro"
  tags {
   Name = "Lesson 02 - Apache2+PHP"
   }
  key_name = "${aws_key_pair.dev.key_name}"
  security_groups = ["public"]
  provisioner "local-exec" {
    command = "echo ${aws_instance.lesson02-apache.public_ip} > ip_address1.txt"
  }
  provisioner "file" {
    source      = "b1.sh"
    destination = "/tmp/bootstrap.sh"
    connection {
      user = "admin"
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh",
    ]
    connection {
      user = "admin"
    }
   }
}
resource "aws_instance" "lesson02-mysql" {
  ami = "ami-0b0bac64"
  instance_type = "t2.micro"
  tags {
   Name = "Lesson 02 - MySQL-server"
   }
  key_name = "${aws_key_pair.dev.key_name}"
  security_groups = ["public"]
  provisioner "local-exec" {
    command = "echo ${aws_instance.lesson02-mysql.public_ip} > ip_address2.txt"
  }
  provisioner "file" {
    source      = "b2.sh"
    destination = "/tmp/bootstrap.sh"
    connection {
      user = "admin"
    }
   }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "/tmp/bootstrap.sh",
    ]
    connection {
      user = "admin"
    }
   }
}
