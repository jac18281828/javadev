FROM debian:stable-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt update && \
    apt install -y -q --no-install-recommends \
    sudo ca-certificates curl git gnupg2 \
    build-essential default-jdk maven ripgrep \
    npm \ 
    && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install javadoc -g

RUN useradd --create-home -s /bin/bash jac
RUN usermod -a -G sudo jac
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV JAVA_HOME=/usr/lib/jvm/default-java

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="javadev" \
    org.label-schema.description="Java Development Container" \
    org.label-schema.url="https://github.com/jac18281828/javadev" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="git@github.com:jac18281828/javadev.git" \
    org.label-schema.vendor="John Cairns" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0" \
    org.opencontainers.image.description="Java OpenJDK Development container"

