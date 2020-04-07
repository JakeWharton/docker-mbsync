FROM golang:alpine AS build
RUN apk add --no-cache shellcheck

RUN mkdir /overlay
COPY root/ /overlay/
RUN shellcheck /overlay/*


FROM alpine:latest
LABEL maintainer="Jake Wharton <jakewharton@gmail.com>"

ENV CRON="" \
    HEALTHCHECK_ID=""

RUN apk add --no-cache \
      isync \
      curl \
 && rm -rf /var/cache/* \
 && mkdir /var/cache/apk

COPY root/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
