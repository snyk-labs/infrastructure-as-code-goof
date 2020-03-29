#!/bin/bash

set -e

eval $(minikube docker-env)

echo "============="
echo "Deleting app..."
echo "============="

kubectl delete -n default service ci-service
kubectl delete -n default deployment app-deployment
kubectl delete -f RBAC.yaml
docker image rm app:1.0.0 -f
