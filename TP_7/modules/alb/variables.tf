variable "vpc_id" {
  type = string
}

variable "my_ip_cidr" {
  type = string  
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "public_subnets" {
  type = list(string)
}

variable "aws_instances" {
  type = list(string)
}