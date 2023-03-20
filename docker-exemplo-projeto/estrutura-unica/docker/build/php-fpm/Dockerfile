FROM php:8.1.0-fpm

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN apt-get update \
    && apt-get install -y \
    curl \
    libssl-dev \
    openssl \
    nano \
    cron \
    bash \
    libpq-dev \
    libz-dev \
    libbz2-dev \
    zlib1g-dev \
    libmcrypt-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxslt-dev \
    zlib1g-dev \
    zip \
    libzip-dev \
    && pecl install \
    mcrypt-1.0.2 \
    redis \
    mongodb

RUN docker-php-ext-install pdo_mysql gd zip\
    && docker-php-ext-enable pdo_mysql zip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg


# Copy opcache configration
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Install the xdebug
#COPY ./xdebug.ini /tmp

#RUN pecl install xdebug \
#        && docker-php-ext-enable xdebug \
#        && cat /tmp/xdebug.ini | grep -v '^#' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Copy xdebug configration
#COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy php.ini configration
COPY ./php.ini /usr/local/etc/php/php.ini

# Clear package lists
RUN rm -rf /var/lib/apt/lists/*

# Permissions
RUN groupmod -o -g 1000 www-data && \
    usermod -o -u 1000 -g www-data www-data
RUN chown -R www-data:www-data /var/www
RUN chmod u+rwx,g+rx,o+rx /var/www
RUN find /var/www -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www -type f -exec chmod u+rw,g+rw,o+r {} +

CMD ["php-fpm"]

EXPOSE 9000
