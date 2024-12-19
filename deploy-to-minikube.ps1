#!/bin/bash

#Set Minikube's docker environment
#minikube delete

#minikube start --driver=docker

#kubectl get nodes

minikube status

cd ./kube

kubectl delete -f .
kubectl apply -f .

$frontPodName = $(kubectl get pods -l app=frontend -o jsonpath='{.items[0].metadata.name}')

Write-Output "Write the following in this order"
Write-Output "kubectl delete service frontend-service"
Write-Output "kubectl expose pod $frontPodName --type=NodePort --name=frontend-service"
Write-Output "minikube service frontend-service"



#$minikubeIp = minikube ip
#$nodePort = kubectl get svc frontend-service -o jsonpath='{.spec.ports[0].nodePort}'

#$serviceUrl = "http://$($minikubeIp):$($nodePort)"
#Write-Output "CHECK THIS LINK!!!!: $serviceUrl"


#kubectl expose pod frontend-77658c48c-gk48z --type=NodePort --name=frontend-service


































 SNYK-DOTNET-MICROSOFTASPNETCOREWEBSOCKETS-72891:
    - '*':
        reason: This vulnerability does not affect my project, as we are not using the affected version.
        expires: 2025-01-09T12:54:24.659Z
        created: 2024-12-10T12:54:24.662Z
  SNYK-DOTNET-MICROSOFTASPNETCOREWEBSOCKETS-72898:
    - '*':
        reason: This vulnerability does not affect my project, as we are not using the affected version.
        expires: 2025-01-09T12:54:24.659Z
        created: 2024-12-10T12:54:24.662Z
  SNYK-DOTNET-NEWTONSOFTJSON-2774678:
    - '*':
        reason: This vulnerability has been fixed in later versions. We will upgrade as soon as feasible.
        expires: 2025-01-09T12:54:24.659Z
        created: 2024-12-10T12:54:24.662Z
  SNYK-DOTNET-SYSTEMNETWEBSOCKETSWEBSOCKETPROTOCOL-72894:
    - '*':
        reason: This vulnerability does not affect my project, as we are not using the affected version.
        expires: 2025-01-09T12:54:24.659Z
        created: 2024-12-10T12:54:24.662Z
  SNYK-DOTNET-SYSTEMTEXTENCODINGSWEB-1253267:
    - '*':
        reason: This vulnerability has been fixed in later versions. We will upgrade as soon as feasible.
        expires: 2025-01-09T12:54:24.659Z
        created: 2024-12-10T12:54:24.662Z