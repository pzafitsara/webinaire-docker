#!/bin/bash
alias kubectl="minikube kubectl --"
kubectl create deployment "$1" --image="$2"
kubectl get deployments
kubectl get pods

#kubectl delete -n default deployment "$1"

#kubectl delete svc nginx