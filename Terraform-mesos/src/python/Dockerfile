FROM alpine:3.13

MAINTAINER Krishna Maram

ENV TERRAFORM_VERSION=0.14.6

ENV CSP_CMD "--help"

RUN apk update 
RUN apk add --no-cache curl py-pip  jq python3 python3-dev gcc curl bash ca-certificates git openssl unzip wget && \
    pip install --upgrade pip && pip install awscli netaddr requests boto3 && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    rm -rf /var/tmp/*
    
ADD . /mesos-terraform

WORKDIR /mesos-terraform

ENTRYPOINT ./entrypoint.py ${CSP_CMD}
