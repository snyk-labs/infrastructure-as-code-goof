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
echo "Deploy redis..."
echo "==============="

cd redis
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

echo "==============="
echo "Deploy admin..."
echo "==============="

cd admin
docker build -t admin:1.0.0 .
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
cd ..

kubectl apply -f ingress.yaml
