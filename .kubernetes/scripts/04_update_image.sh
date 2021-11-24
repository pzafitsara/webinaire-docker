#!/bin/bash

kubectl set image deployment "$1" "$1"="$2" --cluster=minikube --record=true
kubectl get pods -o wide
kubectl rollout history deployment "$1"
#kubectl rollout history deployment "$1" --revision=4
#kubectl rollout undo deployment "$1" --to-revision=1