#!/bin/bash

set -e

eval $(minikube docker-env)
minikube addons enable ingress

echo "============="
echo "Deploy web..."
echo "============="

cd web
docker build -t web:1.0.0 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

echo "==============="
echo "Deploy payment..."
echo "==============="

cd payment
docker build -t payment:1.0.0 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

kubectl apply -f ingress.yaml
