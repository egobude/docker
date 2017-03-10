FROM alpine:3.5

RUN apk add --no-cache wget php7 php7-phar php7-mbstring \
 	&& ln -s /usr/bin/php7 /usr/bin/php

RUN wget http://get.sensiolabs.org/php-cs-fixer.phar -O php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer

VOLUME ["/app"]

WORKDIR /app

ENTRYPOINT ["php-cs-fixer"]

CMD ["--help"]