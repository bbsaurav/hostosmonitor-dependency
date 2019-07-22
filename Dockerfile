# Get the base Ubuntu image from Docker Hub
FROM ubuntu:latest

# Update apps on the base image
RUN apt-get update
RUN apt-get install -y build-essential cmake zlib1g-dev libcppunit-dev git subversion wget && rm -rf /var/lib/apt/lists/*

# Install openssl
RUN wget https://www.openssl.org/source/openssl-1.0.2s.tar.gz -O - | tar -xz
WORKDIR /openssl-1.0.2s
RUN ./config shared --prefix=/usr/local/openssl --openssldir=/usr/local/openssl && make && make install

ENV OPENSSL_ROOT_DIR=/usr/local/openssl

WORKDIR /
# Install libssh
RUN wget https://www.libssh.org/files/0.9/libssh-0.9.0.tar.xz && tar -xf libssh-0.9.0.tar.xz
WORKDIR /libssh-0.9.0
RUN mkdir build && cd build && cmake -DUNIT_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release .. && make && make install

LABEL Name=docker Version=0.0.1
