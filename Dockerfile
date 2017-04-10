FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y \
      git \
      tig \
      build-essential \
      libssl-dev \
      libffi-dev \
      ack-grep \
      acl \
      python-pip \
      python-dev \
      awscli \
      libreadline-dev \
      wget \
      software-properties-common \
      unzip && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get -y install ruby2.3 && \
    wget -qO- https://get.docker.com/ | sh && \
    usermod -aG docker $(whoami) && \
    pip install docker-compose
