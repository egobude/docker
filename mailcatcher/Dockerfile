FROM ruby:latest

RUN gem install mailcatcher

EXPOSE 80 25

ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--smtp-port=25", "--http-ip=0.0.0.0", "--http-port=80", "--foreground"]