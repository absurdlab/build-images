FROM node:lts-alpine

ARG CHINA

RUN if [[ ! -z $CHINA ]]; then \
        echo "Configuring for China environment"; \
        sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
        npm install cnpm -g --registry=https://registry.npm.taobao.org; \
    else \
        npm install cnpm -g; \
    fi

ENTRYPOINT ["/bin/sh"]