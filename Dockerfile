FROM debian:jessie

RUN apt-get update && \
    apt-get upgrade -y

ENV PYTHONIOENCODING=UTF-8

RUN apt-get install -y \
    python \
    python-pip \
    python-virtualenv \
    vim \
    jq && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade awscli

COPY bin/* /usr/local/bin/

COPY . /cluster-scaler
WORKDIR /cluster-scaler

CMD scripts/run.sh
