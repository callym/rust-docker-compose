FROM rust:latest

RUN apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common py-pip
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt update
RUN apt install docker-ce

RUN pip install docker-compose

RUN cargo install cargo-make

CMD ["/bin/bash"]
