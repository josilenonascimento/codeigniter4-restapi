FROM php:7.3-apache

RUN apt-get update && apt install -y nano git g++ unzip zlib1g-dev libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl mysqli pdo pdo_mysql \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --filename=composer \
    && mv composer /usr/local/bin \
    && a2enmod rewrite

WORKDIR /var/www/html

