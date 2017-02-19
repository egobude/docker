FROM alpine:3.3



RUN \
	apk add --update lsyncd openssh && rm -rf /var/cache/apk/*

CMD ["lsyncd", "/etc/lrsync/lrsync.lua"]
