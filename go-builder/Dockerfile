FROM golang:1.14.1-alpine3.11

ARG CHINA

RUN if [[ ! -z $CHINA ]]; then \
        echo "Configuring for China environment"; \
        sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    fi
RUN apk add --update --no-cache build-base

ENTRYPOINT ["/bin/sh"]