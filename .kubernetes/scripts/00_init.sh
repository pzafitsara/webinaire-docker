#!/bin/bash

set eux;
#Il faut installer minikube avant
minikube start --driver=docker --v=5
minikube status
alias kubectl="minikube kubectl --"
minikube dashboard
