#!/bin/bash

#Set Minikube's docker environment
minikube start --driver=docker

kubectl get nodes

& minikube -p minikube docker-env | Invoke-Expression

minikube status

#docker build -t localhost:5000/frontend:latest .
minikube image load localhost:5000/frontend:latest
kubectl apply -f ./kube/frontend-deployment.yaml   

#docker build -t localhost:5000/api-gateway:latest .
minikube image load localhost:5000/api-gateway:latest
kubectl apply -f ./kube/api-gateway.yaml

#docker build -t localhost:5000/tweetservice:latest .
minikube image load localhost:5000/tweetservice:latest
kubectl apply -f ./kube/tweetservice-deployment.yaml

#docker build -t localhost:5000/notifiservice:latest .
minikube image load localhost:5000/notifiservice:latest
kubectl apply -f ./kube/notifservice-deployment.yaml

$frontPodName = $(kubectl get pods -l app=frontend -o jsonpath='{.items[0].metadata.name}')

kubectl expose pod $frontPodName --type=NodePort --name=frontend-service
minikube service frontend-service

#$minikubeIp = minikube ip
#$nodePort = kubectl get svc frontend-service -o jsonpath='{.spec.ports[0].nodePort}'

#$serviceUrl = "http://$($minikubeIp):$($nodePort)"
#Write-Output "CHECK THIS LINK!!!!: $serviceUrl"


#kubectl expose pod frontend-77658c48c-gk48z --type=NodePort --name=frontend-service