
FROM ubuntu:14.04

MAINTAINER jun zhan <zhanjun@gmail.com>

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -yq \
    git cmake build-essential \
    g++ \
    automake \
    autoconf \
    autoconf-archive \
    libtool \
    libevent-dev \
    libdouble-conversion-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    liblz4-dev \
    liblzma-dev \
    libsnappy-dev \
    make \
    zlib1g-dev \
    binutils-dev \
    libjemalloc-dev \
    libssl-dev \
    libbz2-dev \
    wget curl libcurl4-openssl-dev\
    python python-dev python-pip python-virtualenv \
    libzmq3-dev \
    libhwloc-dev scons \
    python-numpy \
    libatlas3-base libatlas-base-dev \
    vim subversion \
    redis-server nginx \
    php5 php5-dev

#golang
RUN wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.5.1.linux-amd64.tar.gz
ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /jun/golang


RUN mkdir -p /jun/golang
WORKDIR /jun
ADD . /jun

EXPOSE 80 443 8080
CMD ["/bin/bash"]

RUN apt-get clean