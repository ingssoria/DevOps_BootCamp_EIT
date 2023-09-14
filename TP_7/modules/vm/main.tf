module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.vm_name

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = var.security_group_ids
  subnet_id              = var.subnet_id

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              sudo bash -c 'echo "<html><h3>Instance name: ${var.vm_name}</h3><h3>Region: ${var.region}</h3></html>" > /var/www/html/index.html'
              EOF

  tags = {
    NAME = var.vm_name
    OWNER = "ing.ssoria@gmail.com"    
  }
}