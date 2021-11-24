FROM zfpoly/apache-php:5.3.0

#Copie des configuration de l'application
COPY ./configs/php/app-symfony.ini /usr/local/etc/php/conf.d/app-symfony.ini

#Suppression des vhosts présents dans l'image
RUN rm -r /etc/apache2/sites-available/* && rm -r /etc/apache2/sites-enabled/*

#Copie et activation du vhost de l'application
COPY ./configs/apache/vhost/app-symfony.conf /etc/apache2/sites-available/app-symfony.conf
RUN a2ensite app-symfony

COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["run-apache"]

WORKDIR /var/www/html

EXPOSE 80

