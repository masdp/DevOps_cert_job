provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "build" {
  instance_type   = "${var.instance_type}"
  ami             = "${var.ami_id}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_group}"]
  tags = {
    Name = "build"
  }
  
  provisioner "remote-exec" {
    inline = ["echo Build is up"]

    connection {
      type        = "ssh"
      host        = "${self.public_ip}"
      user        = "ubuntu"
      private_key = "${file(var.private_key_path)}"
    }
  }
  provisioner "local-exec" {
    command = "echo '[build]' > build && echo ${self.public_ip} >> build"
  } 
  
}

resource "aws_instance" "stage" {
  instance_type   = "${var.instance_type}"
  ami             = "${var.ami_id}"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = ["${var.security_group}"]
  tags = {
    Name = "stage"
  }

  provisioner "remote-exec" {
    inline = ["echo Stage is up"]

    connection {
      type        = "ssh"
      host        = "${self.public_ip}"
      user        = "ubuntu"
      private_key = "${file(var.private_key_path)}"
    }
  } 
  provisioner "local-exec" {
    command = "echo '[stage]' > stage && echo ${self.public_ip} >> stage"
  }
}

