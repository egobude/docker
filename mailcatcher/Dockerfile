FROM ruby:latest

RUN groupadd -r mailcatcher && useradd -r -g mailcatcher mailcatcher

USER mailcatcher

RUN gem install mailcatcher

EXPOSE 25 80

CMD ["mailcatcher", "--smtp-ip=0.0.0.0", "--smtp-port=25", "--http-ip=0.0.0.0", "--http-port=80", "-f"]