terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.10.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"  
}

data "aws_vpcs" "all_vpcs" {}

data "aws_subnet" "default_public_subnets" {
  vpc_id         = data.aws_vpcs.all_vpcs.ids[0]
  availability_zone = "us-east-1a"
}

locals {
  default_vpc_id = data.aws_vpcs.all_vpcs.ids[0]
  cidr_block_us_east_1a = data.aws_subnet.default_public_subnets.cidr_block
  default_public_subnet_id_us_east_1a = element(data.aws_subnet.default_public_subnets.*.id, 0)
}

resource "aws_security_group" "WinServer-sg-rdp" {
    name = "WinServer-sg-rdp"
    description = "Acceso Remoto WinServer"
    vpc_id = local.default_vpc_id // "vpc-0daa37eb95f5f7a26"
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = [local.cidr_block_us_east_1a] // ["172.31.32.0/20"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]        
    }

    tags = {       
        OWNER="ing.ssoria@gmail.com"
    }    
}

resource "aws_instance" "WinServer" {
    ami = "ami-0fc682b2a42e57ca2"
    instance_type = "t2.micro"
    key_name = "devops-user"
    associate_public_ip_address = false
    vpc_security_group_ids = [aws_security_group.WinServer-sg-rdp.id]
    subnet_id = local.default_public_subnet_id_us_east_1a // "subnet-09b891ef82e36f895"

    tags = {
        Name="WinServer"
        OWNER="ing.ssoria@gmail.com"
    }
}