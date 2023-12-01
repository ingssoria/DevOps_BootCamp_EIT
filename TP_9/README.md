## Descripción del desafío

En este desafio vamos a trabajar sobre algunas herramientas vistas en clase y que ya estuvimos practicando, este desafio cuenta con dos partes:
1. Esta orientada a construir una imagen de docker y publicarla en docker hub
2. Desplegar esta imagen en su cluster de minikube.

## Construir y publicar una imagen docker.

#### Comando Docker Pull:
* utilizando la última versión
```bach
docker pull ingssoria/tp-9-image:latest
```
* utilizando una versión específica
```bach
docker pull ingssoria/tp-9-image:<versionID>
```

#### Comando Docker Run:
* utilizando la última versión
```bach
docker run -d -p 8080:80 --name TP_9-contenedor ingssoria/tp-9-image:latest
```
* utilizando una versión específica
```bach
docker run -d -p 8080:80 --name TP_9-contenedor ingssoria/tp-9-image:<versionID>
```
## Desplegar una imagen en minikube.

#### Para para la creación del cluster de kubernetes con Minikube (Windows SO)
1 - Instalación de Minikube:
* Con chocolatey (abrir powershell como admin) ejecutar
```bach
choco install minikube -y --params "/Global"
```    
2 - Inicia Minikube:
* Soportado en Docker (abrir powershell como admin) ejecutar	
```bach
minikube start --vm-driver=docker
```
3 - Verificación del estado de Minikube:
```bach
minikube status
kubectl get nodes
kubectl get pods --all-namespaces
```

4 - Creación del espacio de nombre
```bach
kubectl create ns tp9-ns
```

5 - Acceso al Dachboard
```bach
minikube dashboard 
```

## Links de referencias
[Encuentra el archivo ingssoria/tp-9-image en DockerHub](https://hub.docker.com/r/ingssoria/tp-9-image/tags)
