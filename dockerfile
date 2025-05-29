FROM docker.n8n.io/n8nio/n8n:1.83.2

USER root
RUN apk update \
 && apk add --no-cache bash \
 && rm -rf /var/cache/apk/*

USER node