#!/bin/bash

set -e

eval $(minikube docker-env)

echo "============="
echo "Deleting ingress..."
echo "============="
kubectl delete -n default ingress resource-limitation-pod-ingress

echo "============="
echo "Deleting app1..."
echo "============="

kubectl delete -n default service app1-service
kubectl delete -n default deployment app1-deployment

echo "==============="
echo "Deleting app2..."
echo "==============="

kubectl delete -n default deployment app2-deployment
kubectl delete -n default service app2-service