#!/bin/bash

kubectl set image deployment "$1" "$1"="$2" --cluster=minikube --record
kubectl get pods -o wide
kubectl rollout history deployment "$1"
#kubectl rollout undo deployment --to-revision=1 "$1"
#kubectl rollout history deployment --revision=2 "$1"  