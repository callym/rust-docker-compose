FROM docker:latest

RUN apk add --no-cache py-pip
RUN pip install docker-compose

RUN curl https://sh.rustup.rs > rustup.sh
RUN sh rustup.sh --default-toolchain none -y
ENV PATH=$PATH:~/.cargo/bin
RUN rustup install stable

RUN cargo install cargo-make
CMD ["/bin/bash"]
