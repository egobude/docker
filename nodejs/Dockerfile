FROM node:5

MAINTAINER Benedikt Schmitz <benedikt.schmitz@avency.de>

WORKDIR /data
ENV HOME=/data

RUN npm install -g bower grunt-cli && npm set cache /data/.npm --global

CMD ["bash"]