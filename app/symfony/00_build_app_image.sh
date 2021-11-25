#!/bin/bash
set -eux;

echo "=> CREATION DE LA NOUVELLE IMAGE"
docker build -t "$1" .