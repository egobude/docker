#!/bin/sh

# exit if a command fails
set -e

version="1.10"

# install curl (needed to install rust)
apk --update add --virtual build-dependencies gcc make musl-dev curl

# download
curl -sL https://github.com/kr/beanstalkd/archive/v$version.tar.gz | tar xvz -C /tmp

# build and install
cd /tmp/beanstalkd-$version
sed -i "s|#include <sys/fcntl.h>|#include <fcntl.h>|g" sd-daemon.c
make
cp beanstalkd /usr/bin

# cleanup package manager
apk del build-dependencies
rm -rf /tmp/* \
rm -rf /var/cache/apk/*