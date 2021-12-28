variable "region" {
 default = "us-east-2"
}

variable "ami_id" {
 default = "ami-0fb653ca2d3203ac1"
}

variable "security_group" {
 default = "sg-06df6b76d3df1b2cb"
}

variable "key_name" {
  default = "AWS-general"
}

variable "instance_type" {
 default = "t2.micro"
}

variable "public_key_path" {
 default = "/home/ubuntu/.ssh/AWS-general.pub"
}

variable "private_key_path" {
 default = "~/.ssh/aws.pem"
}
