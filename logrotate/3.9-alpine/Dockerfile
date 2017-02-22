FROM alpine:3.4

RUN apk --update add logrotate=3.9.2-r0

ADD logrotate.conf /logrotate.conf
ADD run.sh /run.sh

RUN chmod +x /run.sh
CMD ["/run.sh"]