#!/bin/bash
set -x

eval $(minikube docker-env)
gradle build && docker-compose build

minikube kubectl -- delete namespace hands-on
minikube kubectl -- create namespace hands-on
minikube kubectl -- config set-context $(minikube kubectl -- config current-context) --namespace=hands-on
./kubernetes/scripts/deploy-dev-env.bash 

./test-em-all.bash

minikube kubectl -- apply -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.yaml

minikube kubectl -- wait --timeout=600s --for=condition=ready pod --all -n cert-manager


exit 0
