FROM php:8.0-fpm
RUN apt update&&\
    apt upgrade -y &&\
    apt install -y libzip-dev libbz2-dev libcurl4-openssl-dev libxml2-dev  libjpeg-dev libpng-dev libldap2-dev busybox libfreetype6-dev libonig-dev libmemcached-dev zlib1g-dev &&\
    apt clean -y &&\
    pecl install memcached &&\
    docker-php-source extract &&\
    docker-php-ext-configure gd --with-freetype --with-jpeg &&\
    docker-php-ext-install  -j$(nproc) mbstring soap gd xml intl mysqli  ldap zip curl opcache &&\
    docker-php-ext-enable memcached