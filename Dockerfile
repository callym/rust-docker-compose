FROM rust:latest

RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common python3-pip -y

# https://askubuntu.com/questions/870889/cant-start-docker-on-ubuntu-16-04-with-driver-not-supported-error/870890
RUN echo '{ "storage-driver": "overlay2" }' > /etc/docker/daemon.json

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install docker-ce -y

RUN pip3 install docker-compose

RUN cargo install cargo-make

COPY dockerd-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/dockerd-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]

CMD ["/bin/bash"]
