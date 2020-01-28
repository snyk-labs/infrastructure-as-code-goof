#!/bin/bash

set -e

eval $(minikube docker-env)

echo "============="
echo "Deleting ingress..."
echo "============="
kubectl delete -n default ingress privileged-pod-ingress

echo "============="
echo "Deleting web..."
echo "============="

kubectl delete -n default service payment-service
kubectl delete -n default deployment payment-deployment

echo "==============="
echo "Deleting payment..."
echo "==============="

kubectl delete -n default deployment web-deployment
kubectl delete -n default service web-service