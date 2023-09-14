module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.1.1"

    name = var.vpc_name
    cidr = var.cidr

    azs             = var.azs
    public_subnets  = var.public_subnets

    tags = {
        NAME = var.vpc_name
        OWNER = "ing.ssoria@gmail.com"
    }
}

resource "aws_security_group" "ubuntu-admin-sg-ssh" {
  name        = "ubuntu-admin-sg-ssh"
  description = "Acceso Remoto Ubuntu"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"   
    cidr_blocks = [var.my_ip_cidr]
  }

  tags = {
      NAME = "ubuntu-admin-sg-ssh"
      OWNER = "ing.ssoria@gmail.com"
  }   
}

resource "aws_security_group" "apache-access-sg-http" {
  name        = "apache-access-sg-http"
  description = "Acceso Apache Server"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"    
    cidr_blocks = [var.my_ip_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      NAME = "apache-access-sg-http"
      OWNER = "ing.ssoria@gmail.com"
  }   
}
