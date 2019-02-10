FROM alpine

RUN apk add --update --no-cache \
    bash bash-completion \
    ca-certificates gpgme\
    tar curl jq \
    openssh-client

RUN curl https://raw.githubusercontent.com/infinimesh/kaf/master/godownloader.sh | BINDIR=/usr/local/bin bash

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]