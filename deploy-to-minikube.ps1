#!/bin/bash

#Set Minikube's docker environment
minikube stop

minikube start

& minikube -p minikube docker-env | Invoke-Expression

kubectl apply -f kube/frontend-deployment.yaml       
kubectl apply -f kube/tweetservice-deployment.yaml
kubectl apply -f kube/api-gateway-deployment.yaml

#kubectl expose pod frontend-77658c48c-gk48z --type=NodePort --name=frontend-service