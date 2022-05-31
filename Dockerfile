ARG VERSION=stable-slim
FROM debian:${VERSION} 

RUN export DEBIAN_FRONTEND=noninteractive && \
        apt update && \
        apt install -y -q --no-install-recommends \
        sudo ca-certificates curl git \
        build-essential default-jdk maven ripgrep
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*

RUN useradd --create-home -s /bin/bash jac
RUN usermod -a -G sudo jac
RUN echo '%jac ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

CMD echo "Java Dev"
