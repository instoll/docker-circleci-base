FROM ubuntu:trusty

RUN apt-get update && \
    echo "Install CircleCI required packages" && \
      apt-get install -y \
        ca-certificates \
        git \
        ssh \
        curl \
        gzip \
        tig \
        build-essential && \
    echo "Install custom packages" && \
      apt-get install -y \
        libssl-dev \
        libffi-dev \
        ack-grep \
        acl \
        wget \
        software-properties-common \
        unzip && \
    echo "Install AWS CLI" && \
      apt-get install -y awscli && \
    echo "Install Python" && \
      apt-get install -y python-dev python-pip && \
    echo "Install Ruby 2.3 and Gems" && \
      apt-add-repository ppa:brightbox/ruby-ng && \
      apt-get update && \
      apt-get install -y ruby2.3 ruby2.3-dev libreadline-dev && \
      echo "gem: --no-document" >> ~/.gemrc && \
      gem install bundler aws-sdk && \
    echo "Install NodeJS" && \
      curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && \
      apt-get install -y nodejs && \
      ln -s /usr/bin/nodejs /usr/bin/node && \
    echo "Install Docker" && \
      wget -qO- https://get.docker.com/ | sh && \
      usermod -aG docker $(whoami) && \
      pip install docker-compose
