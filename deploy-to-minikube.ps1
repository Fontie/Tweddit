#!/bin/bash

#Set Minikube's docker environment
minikube start --drive=docker

kubectl get nodes

& minikube -p minikube docker-env | Invoke-Expression

minikube status

kubectl apply -f ./kube/frontend-deployment.yaml       
kubectl apply -f ./kube/tweetservice-deployment.yaml
kubectl apply -f ./kube/notifservice-deployment.yaml
kubectl apply -f ./kube/api-gateway.yaml

#kubectl expose pod frontend-77658c48c-gk48z --type=NodePort --name=frontend-service