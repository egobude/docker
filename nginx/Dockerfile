FROM smebberson/alpine-nginx:latest

WORKDIR /data

ADD root /
RUN mkdir -p /data /var/lib/nginx/tmp/ && chown -R nginx:www-data /data /var/lib/nginx/tmp/

VOLUME ["/data"]