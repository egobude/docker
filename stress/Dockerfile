FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y stress && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["stress"]