#!/bin/bash
set -eux

kubectl expose deployment "$1" --type=LoadBalancer --port=80
minikube service "$1"
# minikube service list
#kubectl delete -n default service "$1"