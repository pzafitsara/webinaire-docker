#!/bin/sh
set -eux

IMAGE_TAG=$(date -u +"%y.%m%d.%H%M%S")
cd ./app/laravel ; \
    ls -alF ;
    docker build -t zfpoly/app-laravel:$IMAGE_TAG . ; \
    docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}
    docker push zfpoly/app-laravel:$IMAGE_TAG