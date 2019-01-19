FROM docker:latest

RUN apk add --no-cache py-pip curl
RUN pip install docker-compose

RUN curl https://sh.rustup.rs -sSf | sh
ENV PATH=$PATH:~/.cargo/bin
RUN cargo install cargo-make

CMD ["/bin/bash"]
