#!/bin/sh
set -eux

cd /tmp
#https://forum.directadmin.com/threads/how-to-build-php-5-3-5-4-5-5-on-debian9-10-centos8.58672/
tar xzf openssl.tar.gz; \
  mv /tmp/openssl-1.0.2u /tmp/openssl; \
  cd /tmp/openssl; \
  ./config no-ssl2 no-ssl3 zlib-dynamic -fPIC && make -j$(nproc) && make install_sw; \
  rm -rf /tmp/*
  cd