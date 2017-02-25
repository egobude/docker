FROM ubuntu:16.04

ENV PUBLICHOST localhost

# Install dependencies
RUN set -xe \
    && apt-get update \
    && apt-get install -y pure-ftpd \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd ftpgroup \
    && useradd -g ftpgroup -m ftpuser

# Expose ports
EXPOSE 21 30000-30009

# Define volumes
VOLUME /home/ftpuser /etc/pure-ftpd

# Define startup command
CMD /usr/sbin/pure-ftpd -c 50 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30009
