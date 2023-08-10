## Objetivo
### - Se necesita crear una máquina virtual cuyo SO sea Windows. Que posea un Disco virtual de al menos 5 Gb y que pueda ser accedido vía remota.

## Pasos realizados para la ejecución del provisionamiento
### 1. Generar las credenciales de AWS

### 2. Instalar el CLI de AWS

### 3. Configurar las credenciales de AWS
```bash	
aws configure
```
### 4. Instalar Terraform

### 5. Configurar variables de entorno para autenticar el provider de AWS.

### 6. Inicializar Terraform

```bash
terraform init
```
### 7. Dessarrollar el módulo para la ejecución del plan de Terreform

#### 7.1 Obtener y almacenar los datos de:
    - default_vpc_id
    - cidr_block
    - default_public_subnet_id

#### 7.2 Crear los siguientes recursos: 
    - Grupo de seguridad, para restringir el acceso por via de escritorio remoto.
    - Instancia de EC2, de tipo t2.micro.

### 8. Ejecutar terraform
```bash
terraform plan --out plan.out
terraform apply
```

## Resultados
```bash
Saved the plan to: plan.out

To perform exactly these actions, run the following command to apply:
    terraform apply "plan.out"
PS C:\Users\ssoria\Desktop\EducacionIT\Ejercicios Practicos\6\devops-educacionit-desafio6> terraform plan --out plan.out
data.aws_vpcs.all_vpcs: Reading...
aws_security_group.serverwindows-sg: Refreshing state... [id=sg-0826369f388c9147c]
data.aws_vpcs.all_vpcs: Read complete after 1s [id=us-east-1]
data.aws_subnet.default_public_subnets: Reading...
data.aws_subnet.default_public_subnets: Read complete after 0s [id=subnet-09b891ef82e36f895]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.WinServer will be created
  + resource "aws_instance" "WinServer" {
      + ami                                  = "ami-0fc682b2a42e57ca2"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "devops-user"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-09b891ef82e36f895"
      + tags                                 = {
          + "Name"  = "WinServer"
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tags_all                             = {
          + "Name"  = "WinServer"
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_security_group.WinServer-sg-rdp will be created
  + resource "aws_security_group" "WinServer-sg-rdp" {
      + arn                    = (known after apply)
      + description            = "Acceso Remoto WinServer"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "172.31.32.0/20",
                ]
              + description      = ""
              + from_port        = 3389
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3389
            },
        ]
      + name                   = "WinServer-sg-rdp"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tags_all               = {
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + vpc_id                 = "vpc-0daa37eb95f5f7a26"
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```


```
data.aws_vpcs.all_vpcs: Reading...
aws_security_group.serverwindows-sg: Refreshing state... [id=sg-0826369f388c9147c]
data.aws_vpcs.all_vpcs: Read complete after 1s [id=us-east-1]
data.aws_subnet.default_public_subnets: Reading...
data.aws_subnet.default_public_subnets: Read complete after 1s [id=subnet-09b891ef82e36f895]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.WinServer will be created
  + resource "aws_instance" "WinServer" {
      + ami                                  = "ami-0fc682b2a42e57ca2"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = false
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "devops-user"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-09b891ef82e36f895"
      + tags                                 = {
          + "Name"  = "WinServer"
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tags_all                             = {
          + "Name"  = "WinServer"
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

  # aws_security_group.WinServer-sg-rdp will be created
  + resource "aws_security_group" "WinServer-sg-rdp" {
      + arn                    = (known after apply)
      + description            = "Acceso Remoto WinServer"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = [
                  + "::/0",
                ]
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "172.31.32.0/20",
                ]
              + description      = ""
              + from_port        = 3389
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 3389
            },
        ]
      + name                   = "WinServer-sg-rdp"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + tags_all               = {
          + "OWNER" = "ing.ssoria@gmail.com"
        }
      + vpc_id                 = "vpc-0daa37eb95f5f7a26"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group.WinServer-sg-rdp: Creating...
aws_security_group.WinServer-sg-rdp: Creation complete after 4s [id=sg-01bc52743ae2a7266]
aws_instance.WinServer: Creating...
aws_instance.WinServer: Still creating... [10s elapsed]
aws_instance.WinServer: Still creating... [20s elapsed]
aws_instance.WinServer: Still creating... [30s elapsed]
aws_instance.WinServer: Still creating... [40s elapsed]
aws_instance.WinServer: Creation complete after 45s [id=i-039f5d63f942a6e67]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```
## Links de referencias
- [Instalacion de Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Documentacion AWS Provider para Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)