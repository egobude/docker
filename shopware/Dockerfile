FROM ubuntu:14.04

MAINTAINER Benedikt Schmitz <zeroboh@gmail.com>

RUN apt-get update && \
    apt-get -y install wget apache2 php5 apache2-utils libapache2-mod-php5 php5-apcu php5-cli php5-curl php5-gd php5-mcrypt php5-mysql curl git unzip && \
    apt-get clean && \
    update-rc.d apache2 defaults && \
    php5enmod mcrypt && \
    a2enmod rewrite && \
    rm -rf /var/www/html

ADD http://releases.s3.shopware.com.s3.amazonaws.com/install_5.1.5_ca9dc97e4751d0cd22d08548c7efe4edc6124f39.zip /tmp/shopware.zip

ADD http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.bz2 /tmp/
RUN tar xvjfC /tmp/ioncube_loaders_lin_x86-64.tar.bz2 /tmp/ \
    && rm /tmp/ioncube_loaders_lin_x86-64.tar.bz2 \
    && mkdir -p /usr/local/ioncube \
    && cp /tmp/ioncube/ioncube_loader_lin_5.5.so /usr/lib/php5/20121212/ioncube.so \
    && bash -c "echo zend_extension = /usr/lib/php5/20121212/ioncube.so > /etc/php5/apache2/conf.d/00-ioncube.ini" \
    && bash -c "echo zend_extension = /usr/lib/php5/20121212/ioncube.so > /etc/php5/cli/conf.d/00-ioncube.ini" \
    && rm -rf /tmp/ioncube \
    && sed --in-place "s/^upload_max_filesize.*$/upload_max_filesize = 10M/" /etc/php5/apache2/php.ini \
    && sed --in-place "s/^memory_limit.*$/memory_limit = 256M/" /etc/php5/apache2/php.ini

ADD container-files /

RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]

EXPOSE 80 443
