#!/bin/sh

#issues (resolved): kubernetes/ingress-nginx runs some jobs before deploying the controller which are also injected with the istio sidecar and hence dont reach a completed state
#todo (done): override the istio sidecar injection with annotations on the job level (Works!)


#Create and label the namespace for NGINX ingress controller
kubectl create namespace ingress-nginx

#Add the Helm repo and update it (Kubernetes community maintained Nginx Ingress controller)
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

#Login to Docker and ACR using token and generated password or ACR login
docker login -u anuadmintoken -p xyz anuchunduridevopsacr.azurecr.io
az acr login -n anuchunduridevopsacr -u anuchunduridevopsacr -p xyz

#Import the 3 images used by nginx controller into your ACR
REGISTRY_NAME=anuchunduridevopsacr
SOURCE_REGISTRY=registry.k8s.io
CONTROLLER_IMAGE=ingress-nginx/controller
CONTROLLER_TAG=v1.8.1
PATCH_IMAGE=ingress-nginx/kube-webhook-certgen
PATCH_TAG=v20230407
DEFAULTBACKEND_IMAGE=defaultbackend-amd64
DEFAULTBACKEND_TAG=1.5

az acr import --name $REGISTRY_NAME --source $SOURCE_REGISTRY/$CONTROLLER_IMAGE:$CONTROLLER_TAG --image $CONTROLLER_IMAGE:$CONTROLLER_TAG
az acr import --name $REGISTRY_NAME --source $SOURCE_REGISTRY/$PATCH_IMAGE:$PATCH_TAG --image $PATCH_IMAGE:$PATCH_TAG
az acr import --name $REGISTRY_NAME --source $SOURCE_REGISTRY/$DEFAULTBACKEND_IMAGE:$DEFAULTBACKEND_TAG --image $DEFAULTBACKEND_IMAGE:$DEFAULTBACKEND_TAG

# Helm install ingress-nginx into ingress-nginx namespace
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --version 4.7.1 --values ingress-values.yaml --debug

# (OR)
---
#Create and label the namespace for NGINX ingress controller
kubectl create namespace ingress-nginx
kubectl label namespace ingress-nginx istio-injection=enabled

#Add the helm repo and update it (Nginx community maintained Nginx Ingress controller)
helm pull oci://ghcr.io/nginxinc/charts/nginx-ingress --untar --version 1.0.1
cd nginx-ingress

#Add annotations to nginx controller pod, service and deployment and install the chart using the following command
helm install ingress-nginx -n ingress-nginx -f ingress-values.yaml .
---

#Create and label the namespace for application
kubectl create namespace application-ns
