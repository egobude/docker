FROM php:7.0-fpm-alpine

# Build arguments
ARG BUILD_DATE
ARG VCS_REF
ARG NAME
ARG PHP_REDIS_VERION="3.0.0"
ARG PHP_YAML_VERION="2.0.0"

ENV COMPOSER_VERSION 1.2.2
ENV COMPOSER_HOME /composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH /composer/vendor/bin:$PATH

# Basic build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name=$NAME \
      org.label-schema.url="https://github.com/egobude/docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/egobude/docker.git" \
      org.label-schema.vcs-type="Git"

RUN set -x \
    && apk --update add mariadb-client mysql-client tar curl openssl sed libuuid postgresql-dev icu-dev gettext-dev curl-dev libxml2-dev openldap-dev libpng libjpeg-turbo yaml libuuid libmcrypt-dev libxslt-dev bzip2-dev \
    && apk add --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool freetype-dev libpng-dev libjpeg-turbo-dev yaml-dev \

    && docker-php-ext-configure gd \
      --with-gd \
      --with-freetype-dir=/usr/include/ \
      --with-png-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/ \

    && docker-php-ext-install \
      gd \
      pdo \
      pdo_mysql \
      pdo_pgsql \
      mbstring \
      opcache \
      intl \
      exif \
      gettext \
      curl \
      json \
      bcmath \
      mcrypt \
      zip \
      bz2 \
      tokenizer \
      fileinfo \
      pcntl \
      xsl \
      xml \
      soap \

    && docker-php-ext-configure ldap --with-libdir=lib/ \
    && docker-php-ext-install ldap \
    && pecl install imagick redis-${PHP_REDIS_VERION} yaml-${PHP_YAML_VERION} uuid \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable yaml \
    && docker-php-ext-enable uuid \
    && apk add --virtual .imagick-runtime-deps imagemagick \
    && apk del .phpize-deps \

    && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --version=${COMPOSER_VERSION} && rm -rf /tmp/composer-setup.php \
    && composer --version \

    && rm -rf /var/cache/apk/*

# Configure PHP
RUN echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini \
    && echo "memory_limit=${PHP_MEMORY_LIMIT:-512M}" > $PHP_INI_DIR/conf.d/memory_limit.ini \
    && echo "upload_max_filesize=${PHP_UPLOAD_MAX_FILESIZE:-256M}" > $PHP_INI_DIR/conf.d/upload_max_filesize.ini \
    && echo "post_max_size=${PHP_UPLOAD_MAX_FILESIZE:-256M}" > $PHP_INI_DIR/conf.d/post_max_size.ini \
    && echo "allow_url_include=${PHP_ALLOW_URL_INCLUDE:-1}" > $PHP_INI_DIR/conf.d/allow_url_include.ini \
    && echo "max_execution_time=${PHP_MAX_EXECUTION_TIME:-240}" > $PHP_INI_DIR/conf.d/max_execution_time.ini \
    && echo "max_input_vars=${PHP_MAX_INPUT_VARS:-1500}" > $PHP_INI_DIR/conf.d/max_input_vars.ini
