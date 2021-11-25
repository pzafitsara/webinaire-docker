FROM zfpoly/apache-php:5.3.0

#Copie des configuration de l'application
COPY ./.docker/configs/php/app-symfony.ini ${PHP_INI_DIR:-/usr/local/etc/php}/conf.d/app-symfony.ini

#Suppression des vhosts présents dans l'image
RUN rm -r /etc/apache2/sites-available/* && rm -r ${APACHE_CONFDIR:-/etc/apache2}/sites-enabled/*

#Copie et activation du vhost de l'application
COPY ./.docker/configs/apache/vhost/app-symfony.conf /etc/apache2/sites-available/app-symfony.conf
RUN a2ensite app-symfony

COPY ./.docker/scripts/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

WORKDIR /var/www/html
EXPOSE 80

ENTRYPOINT ["entrypoint"]
CMD ["run-apache"]