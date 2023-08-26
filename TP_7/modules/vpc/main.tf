module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.1.1"

    name = var.vpc_name
    cidr = var.cidr

    azs             = var.azs
    public_subnets  = var.public_subnets

    tags = {
        OWNER = "ing.ssoria@gmail.com"
    }
}

resource "aws_security_group" "ubuntu-sg-ssh" {
  name        = "ubuntu-sg-ssh"
  description = "Acceso Remoto Ubuntu"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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
      Name= "ubuntu-sg-ssh"
      OWNER="ing.ssoria@gmail.com"
  }   
}

/*module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name = "ubuntu-sg-ssh"
  vpc_id = module.vpc.vpc_id//var.vpc_id// local.tp7_vpc_id // "vpc-0daa37eb95f5f7a26"
  description = "Acceso Remoto Ubuntu"
  //ingress_cidr_blocks = [local.cidr_block_us_east_1a, local.cidr_block_us_east_1b]
  //ingress_cidr_blocks = [var.my_ip_cidr]
  //ingress_rules = ["ssh-tcp"]
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [var.my_ip_cidr]
    }
  ]  
  # ingress_with_cidr_blocks = [
  #   {
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"     
  #   }]  
  egress_rules = ["all-all"]
  tags = {       
      OWNER="ing.ssoria@gmail.com"
  }  
}*/

