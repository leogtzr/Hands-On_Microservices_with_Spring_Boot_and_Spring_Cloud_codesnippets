#!/bin/bash

eval $(minikube docker-env)
gradle build && docker-compose build

minikube kubectl -- delete namespace hands-on
minikube kubectl -- create namespace hands-on
minikube kubectl -- config set-context $(kubectl config current-context) --namespace=hands-on
./kubernetes/scripts/deploy-dev-env.bash 


exit 0
