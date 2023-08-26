output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_name" {
  value = module.vpc.name
}

output "vpc_subnet_1a_id" {
  value = module.vpc.public_subnets[0]
}

output "vpc_subnet_1b_id" {
  value = module.vpc.public_subnets[1]
}

output "security_group_id" {
  value = aws_security_group.ubuntu-sg-ssh.id
# value = module.security-group.security_group_id  
}