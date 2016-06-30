FROM jenkins

USER root

RUN apt-get update -y && apt-get install -y libapparmor-dev docker.io sudo 
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
RUN gpasswd -a jenkins root

RUN systemctl enable docker

ADD start.sh /
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
