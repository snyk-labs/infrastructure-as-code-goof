#!/bin/bash

set -e

eval $(minikube docker-env)
#minikube addons enable ingress

echo "============="
echo "Deploy app..."
echo "============="

cd app
docker build -t app:1.0.0 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

kubectl apply -f RBAC.yaml
