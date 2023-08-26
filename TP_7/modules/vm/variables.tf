variable "vm_name" {
    type = string    
}

variable "ami" {
    type = string
    default = "ami-053b0d53c279acc90"  // aws_linux  
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

variable "security_group_id" {
  type = string
}