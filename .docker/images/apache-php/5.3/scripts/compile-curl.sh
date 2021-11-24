#!/bin/sh
set -eux

cd /tmp
tar xzf curl.tar.gz; \
  mv /tmp/curl-7.71.1 /tmp/curl;\
  cd /tmp/curl; \
  ./configure --prefix=/usr/local/curl --disable-shared --enable-static --disable-dependency-tracking \
        --disable-symbol-hiding --enable-versioned-symbols \
        --disable-threaded-resolver --with-lber-lib=lber \
        --with-ssl=/usr/local/ssl \
        --with-nghttp2 \
        --disable-gssapi --disable-ldap --disable-ldaps --disable-libssh2 --disable-rtsp; \
    make -j$(nproc); \
    make install; \
    rm -rf /tmp/*; \
    cd
