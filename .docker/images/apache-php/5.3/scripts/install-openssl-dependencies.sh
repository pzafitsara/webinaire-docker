#!/bin/sh
set -eux

apt-get update; \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      curl \
      autoconf \
      file \
      g++ \
      gcc \
      gnupg \
      libc-dev \
      make \
      pkg-config \
      re2c \
      zlib1g-dev \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*