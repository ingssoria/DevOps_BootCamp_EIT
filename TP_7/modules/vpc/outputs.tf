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

output "public_subnets" {
  value = var.public_subnets
}

output "security_group_ids" {
  value = [aws_security_group.ubuntu-admin-sg-ssh.id, aws_security_group.apache-access-sg-http.id]
}

output "my_ip_cidr" {
  value = var.my_ip_cidr
}