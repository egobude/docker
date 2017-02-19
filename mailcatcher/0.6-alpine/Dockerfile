FROM ruby:2.1-alpine



# Build arguments
ARG BUILD_DATE
ARG VCS_REF
ARG NAME

# Env variables
ENV MAILCATCHER_VERSION=0.6.5

# Basic build-time metadata as defined at http://label-schema.org
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name=$NAME \
      org.label-schema.url="https://github.com/egobude/docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/egobude/docker.git" \
      org.label-schema.vcs-type="Git"

# Install
RUN set -x \
    && apk --update --no-cache add gcc make g++ zlib-dev sqlite-dev \
    && gem install mailcatcher -v ${MAILCATCHER_VERSION} --no-ri --no-rdoc \
    && apk del gcc make g++ zlib-dev sqlite-dev \
    && rm -rf /var/cache/apk/*

# Smtp and webserver port
EXPOSE 1025 1080

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
