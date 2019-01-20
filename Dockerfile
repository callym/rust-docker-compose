FROM rust:latest

RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common python3-pip -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get install docker-ce -y

RUN pip3 install docker-compose

RUN cargo install cargo-make

COPY dockerd-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["dockerd-entrypoint.sh"]

CMD ["/bin/bash"]
