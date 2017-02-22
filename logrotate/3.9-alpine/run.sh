#!/bin/sh
chown root:root /logrotate.conf
chmod 600 /logrotate.conf

/usr/sbin/logrotate -v -f /logrotate.conf