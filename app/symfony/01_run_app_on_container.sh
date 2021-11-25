#!/bin/bash
set -eux;

DEFAULT_SYMFONY_APP_IMAGE="zfpoly/app-symfony:0.0.1"

echo "=> INSTANCIATION CONTAINER IMAGE ET INTRODUCTION APPLICATION"
docker run --rm \
    --name "${2:-app-symfony}" \
    -p "${HOST_EXPOSED_PORT:-7980}:${CONTAINER_EXPOSED_PORT:-80}" \
    -v "${HOST_PROJECT_DIR:-$PWD}:${CONTAINER_PROJECT_DIR:-/var/www/html}" \
    "${1:-$DEFAULT_SYMFONY_APP_IMAGE}"