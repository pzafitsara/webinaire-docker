#!/bin/sh
set -ex

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- run-apache "$@"
fi

if [ "$1" = 'run-apache' ]; then
    php composer.phar install
    chmod -R 777 app/cache/
    chmod -R 777 app/logs/
    chmod -R 777 app/bootstrap.php.cache
    chmod -R 777 vendor
    #php app/console doctrine:database:create
    #php app/console doctrine:schema:create
    #php app/console doctrine:fixtures:load --append --purge-with-truncate
fi

exec "$@"