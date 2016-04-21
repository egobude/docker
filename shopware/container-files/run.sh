#!/bin/bash

if [ ! -e /var/www/shopware/shopware.php ]; then
    echo "Shopware not found, installing..."
    rm -f /var/www/shopware/index.html \
    && unzip -d /var/www/shopware /tmp/shopware.zip \
    && chown -R www-data /var/www/shopware/var/log \
                         /var/www/shopware/var/cache \
                         /var/www/shopware/web \
                         /var/www/shopware/recovery \
                         /var/www/shopware/themes/Frontend \
                         /var/www/shopware/config.php \
                         /var/www/shopware/files/* \
                         /var/www/shopware/engine/Shopware/Plugins/Community/ \
                         /var/www/shopware/engine/Shopware/Plugins/Default/ \
                         /var/www/shopware/media/*
    echo "done"
fi

exec /usr/sbin/apache2ctl -D FOREGROUND
