variable "aws_region" {
  default = "us-east-2"
}

variable "profile" {
  default = "NK-AWS"
}

variable "ec2_ami" {
  default = "ami-008e1e7f1fcbe9b80 "
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_keypair" {
  default = "Management"
}

variable "ec2_count" {
  type = number
  default = "1"
}

variable "environment" {
  default = "Dev"
}

variable "product" {
  default = "mgmt-master"
}
variable "vpc_id" {
  default = "vpc-0a456cfb0dd41261b"
}
variable "subnets" {
   default = ["subnet-01005b844b3dc722b"]
}
