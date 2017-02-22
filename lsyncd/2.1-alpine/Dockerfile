FROM alpine:3.4

RUN \
	apk add --update lsyncd=2.1.5-r5 openssh && rm -rf /var/cache/apk/*

CMD ["lsyncd", "/etc/lrsync/lrsync.lua"]
