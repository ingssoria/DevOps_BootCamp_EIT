## Descripción del desafío

El objetivo de este ejercicio es crear un balanceador de carga que permita distribuir carga con dos instancias ec2.

### Requisitos:
1. Crear una VPC con dos subredes privadas y dos subredes publicas.
2. Es necesario crear dos instancias EC2, dichas instancias deben estar en dos zonas de disponibilidad distintas.
3. Cada instancia debe poseer instalado un servidor web que muestre el nombre de la instancia y la región en la que se encuentra.
4. Agregar estas instancias a un target group.
5. Crear el balanceador de carga y agregar el target group al balanceador.
