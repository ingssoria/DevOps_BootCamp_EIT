# Creating VPC and Security_group for VM

module "vpc" {
  source = "./modules/vpc"
}

# Creating VMs

module "vm1" {
  source = "./modules/vm"  
  
  vpc_id = module.vpc.vpc_id
  vm_name = "UbuntuServer01"
  security_group_ids= module.vpc.security_group_ids
  subnet_id = module.vpc.vpc_subnet_1a_id
}

module "vm2" {
  source = "./modules/vm"
  
  vpc_id = module.vpc.vpc_id  
  vm_name = "UbuntuServer02"
  security_group_ids= module.vpc.security_group_ids
  subnet_id =  module.vpc.vpc_subnet_1b_id
}

# Creating ALB and ALB_Target_groups

module "alb" {
  source = "./modules/alb"

  vpc_id = module.vpc.vpc_id
  my_ip_cidr = module.vpc.my_ip_cidr
  public_subnets = [module.vpc.vpc_subnet_1a_id, module.vpc.vpc_subnet_1b_id]
  aws_instances = [module.vm1.instance_id, module.vm2.instance_id]
}



