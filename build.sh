#!/bin/bash

set -e

eval $(minikube docker-env)

cd web
docker build -t web:1.0.0 .
kubectl apply -f deployment.yaml
