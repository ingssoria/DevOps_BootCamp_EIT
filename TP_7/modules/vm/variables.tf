variable "vm_name" {
    type = string    
}

variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90" // ubuntu  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_name" {
    type = string
    default = "devops-user"
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "region" {
  type = string
  default = "us-east-1"
}