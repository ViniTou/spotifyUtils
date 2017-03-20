FROM php:7.1.2-apache
RUN docker-php-ext-install pdo pdo_mysql

COPY Docker/Apache/000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443
WORKDIR /var/www

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=192.168.99.1" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN rm -f /var/run/apache2/apache2.pid

