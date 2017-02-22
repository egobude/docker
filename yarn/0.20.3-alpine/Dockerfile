FROM alpine:3.4

RUN \
	echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
	&& apk --no-cache add yarn \
	&& mkdir -p /usr/src/app

WORKDIR /usr/src/app

ENTRYPOINT ["yarn"]

CMD ["--version"]