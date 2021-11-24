#!/bin/sh
set -eux
ls -alF
cd ./app/laravel; \
  php composer.phar install --no-dev --prefer-dist --no-interaction --optimize-autoloader \
  ; \
  # npm install ; \
  # npm run production