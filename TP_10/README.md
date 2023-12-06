## Descripción del desafío

En este desafío nos encontraremos una mezcla de otros desafíos (CICD y Kubernetes), en este caso utilizaremos herramientas de Gitops para automatizar cambios en nuestro deployments y en cualquier otro archivo yaml que configuremos, de esta forma será solo cuestión de hacer los cambios en el código .yaml y dejar que la herramienta que hayamos elegido se encargue de aplicar nuestros cambios (ya sea de forma manual o automática).

Entregable:

* Manifiesto de kubernetes que se aplicará en el cluster, puede ser el deploy de un pod con una imagen.

* Documento con instrucciones de cómo se realizó el desafío (de ser posible adjuntar capturas de pantalla). 


#### Tareas desarrolladas para la resolución del Desafío
1 - Configuracion en GitHub de las Pages
* Generar un Token Classic en la configuracion de la cuenta
* Crear el secret TOKEN para las actions del repositorio asignandole como valor el token antes generado
* Crear la rama gh-pages
```bach
git branch gh-pages 
git push --set-upstream origin gh-pages
```
* Crear y configurar las Actions
* Generar page en la configuarion del repositorio
* Ejecutar las Actions que generan el release y el index.yaml en la branch gh-pages

2 - Instalación y configuración de Helm:
* Con chocolatey (abrir powershell como admin) ejecutar
```bach
choco install kubernetes-helm -y --params "/Global"
``` 
* Configurar el repositorio del proyecto
```bach
    helm repo add github_TP10 https://ingssoria.github.io/DevOps_BootCamp_EIT/
    helm repo list
```

3 - Instalacion del Chart
```bach
    helm install <nombre_del_release> <nombre_repositorio>/<nombre_del_chart>
	helm install tp10 github_TP10/tp10-chart
	helm upgrade tp10 github_TP10/tp10-chart -f values-prod.yaml
```

4 - Iniciar Minikube:
* Soportado en Docker (abrir powershell como admin) ejecutar	
```bach
    minikube start --vm-driver=docker
    minikube dashboard
```

5 - Instalación de ArgoCD en Minikube
* Con chocolatey (abrir powershell como admin) ejecutar
```bach
choco install kubernetes-helm -y --params "/Global"
```  

