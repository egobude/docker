#!/bin/sh
set -e

JUSER="jenkins"

chown -R $JUSER:$JUSER /var/jenkins_home/

exec su $JUSER -c "/bin/tini -- /usr/local/bin/jenkins.sh"
