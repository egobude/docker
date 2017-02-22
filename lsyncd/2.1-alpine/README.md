# Docker lsyncd

## Usage

docker run -d -v /docker/lsyncd/src:/src -v /docker/lsyncd/target:/target -v /docker/lsyncd/lrsync.lua:/etc/lrsync/lrsync.lua zeroboh/lsyncd:2.1-alpine
