#!/bin/bash

set -e

eval $(minikube docker-env)
minikube addons enable ingress
minikube addons enable metrics-server

echo "============="
echo "Deploy APP1..."
echo "============="

cd app1
docker build -t app1:1.0.2 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

echo "==============="
echo "Deploy APP2..."
echo "==============="

cd app2
docker build -t app2:1.0.2 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

kubectl apply -f ingress.yaml
