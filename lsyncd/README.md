# Docker lsyncd

## Usage

docker run -d -v /docker/docker/lsyncd/src:/src -v /docker/docker/lsyncd/target:/target -v /docker/docker/lsyncd/lrsync.lua:/etc/lrsync/lrsync.lua zeroboh/lsyncd
