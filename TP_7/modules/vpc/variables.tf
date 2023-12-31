variable "vpc_name" {
    type = string
    default = "tp7-vpc"
}

variable "cidr" {
    type = string
    default = "172.31.0.0/16"
}

variable "azs" {
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
    type = list(string)
    default = ["172.31.32.0/20", "172.31.0.0/20"]
}

variable "my_ip_cidr" {
  type = string
  default = "190.18.246.166/32"
}

variable "region" {
  type = string
  default = "us-east-1"
}