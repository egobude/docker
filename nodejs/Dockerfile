FROM node:5

WORKDIR /data
ENV HOME=/data

RUN npm install -g bower grunt-cli gulp && npm set cache /data/.npm --global

CMD ["bash"]