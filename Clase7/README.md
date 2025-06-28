# Sopes1_Junio2025

## ¿Qué es un Deployment en Kubernetes?
Un **Deployment** es un recurso de Kubernetes que permite gestionar y mantener actualizadas las réplicas de un conjunto de pods. Facilita el despliegue, actualización y escalado de aplicaciones de manera declarativa.

## ¿Qué es un Ingress en Kubernetes?
Un **Ingress** es un recurso que gestiona el acceso externo a los servicios del clúster, normalmente HTTP/HTTPS. Permite definir reglas de enrutamiento para exponer servicios a través de URLs, balanceo de carga, SSL, etc.

## Comandos básicos de Kubernetes

- Ver pods:
  ```sh
  kubectl get pods
  ```
- Ver deployments:
  ```sh
  kubectl get deployments
  ```
- Ver servicios:
  ```sh
  kubectl get svc
  ```
- Ver ingress:
  ```sh
  kubectl get ingress
  ```
- Describir un recurso:
  ```sh
  kubectl describe <tipo> <nombre>
  ```
- Eliminar un recurso:
  ```sh
  kubectl delete <tipo> <nombre>
  ```

## Configurar Ingress Controller NGINX

- `kubectl create ns nginx-ingress`
- `helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx`
- `helm repo update`
- `helm install nginx-ingress ingress-nginx/ingress-nginx -n nginx-ingress`
- `kubectl get services -n nginx-ingress`

## ¿Cómo implementar el Deployment y el Ingress?

1. Aplica el deployment:
   ```sh
   kubectl apply -f deployment/deployment-node.yml
   ```
2. Aplica el ingress:
   ```sh
   kubectl apply -f ingress/ingress.yml
   ```

Esto creará los recursos definidos en los archivos YAML dentro de tu clúster de Kubernetes.

## Para un service del tipo Nodeport se debe aplicar el siguiente comando

- `kubectl port-forward service/<service-name> <local-port>:<service-port> -n <nombre_namespace>`


## Authors

- [@Diego Juarez]()
