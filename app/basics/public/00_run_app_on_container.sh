#!/bin/bash
set -eux;

DEFAULT_BASIC_APP_IMAGE="php:5.3-apache"

echo "=> RECUPERATION IMAGE DEPUIS UN REGISTRE"
docker pull "${1:-$DEFAULT_BASIC_APP_IMAGE}"

echo "=> INSTANCIATION CONTAINER IMAGE ET INTRODUCTION APPLICATION"
docker run --rm \
    --name "${2:-app-basic}" \
    -p "${HOST_EXPOSED_PORT:-7980}:${CONTAINER_EXPOSED_PORT:-80}" \
    -v "${HOST_PROJECT_DIR:-$PWD}:${CONTAINER_PROJECT_DIR:-/var/www/html/}" \
    "${1:-$DEFAULT_BASIC_APP_IMAGE}"