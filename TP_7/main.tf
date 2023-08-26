# Creating VPC y Security_group from VM

module "vpc" {
  source = "./modules/vpc"
}

# Creating VMs

module "vm1" {
  source = "./modules/vm"  
  
  vpc_id = module.vpc.vpc_id
  vm_name = "UbuntuServer01"
  security_group_id= module.vpc.security_group_id
  subnet_id = module.vpc.vpc_subnet_1a_id
}

module "vm2" {
  source = "./modules/vm"
  
  vpc_id = module.vpc.vpc_id  
  vm_name = "UbuntuServer02"
  security_group_id= module.vpc.security_group_id
  subnet_id =  module.vpc.vpc_subnet_1b_id
}




