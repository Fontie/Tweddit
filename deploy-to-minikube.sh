#!/bin/bash

#Set Minikube's docker environment
eval $(minikube -p minikube docker-env)

#Pull images from the local registry
docker pull localhost:4000/frontend:latest
docker pull localhost:5000/api-gateway:latest
docker pull localhost:5001/tweetservice:latest
docker pull localhost:5002/notifservice:latest

#Deploy the images to Minikube
kubectl set image deployment/frontend frontend=localhost:4000/frontend:latest
kubectl set image deployment/api-gateway api-gateway=localhost:5000/api-gateway:latest
kubectl set image deployment/tweetservice tweetservice=localhost:5001/tweetservice:latest
kubectl set image deployment/notifservice notifservice=localhost:5002/notifservice:latest

#Restart the pods to apply the changes
kubectl rollout restart deployment/frontend
kubectl rollout restart deployment/api-gateway
kubectl rollout restart deployment/tweetservice
kubectl rollout restart deployment/notifservice