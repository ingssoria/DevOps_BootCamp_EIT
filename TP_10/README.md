## Descripción del desafío

En este desafío nos encontraremos una mezcla de otros desafíos (CICD y Kubernetes), en este caso utilizaremos herramientas de Gitops para automatizar cambios en nuestro deployments y en cualquier otro archivo yaml que configuremos, de esta forma será solo cuestión de hacer los cambios en el código .yaml y dejar que la herramienta que hayamos elegido se encargue de aplicar nuestros cambios (ya sea de forma manual o automática).

Entregable:

* Manifiesto de kubernetes que se aplicará en el cluster, puede ser el deploy de un pod con una imagen.

* Documento con instrucciones de cómo se realizó el desafío (de ser posible adjuntar capturas de pantalla). 


#### Tareas desarrolladas para la resolución del Desafío
1 - Instalación de Helm:
* Con chocolatey (abrir powershell como admin) ejecutar
```bach
choco install kubernetes-helm -y --params "/Global"
``` 
* Configurar el repositorio
```bach
helm repo add github https://ingssoria.github.io/TP_10/
``` 

2 - Instalación de ArgoCD en Minikube
* Con chocolatey (abrir powershell como admin) ejecutar
```bach
choco install kubernetes-helm -y --params "/Global"
```  