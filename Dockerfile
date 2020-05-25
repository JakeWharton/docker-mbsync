FROM golang:alpine AS build
RUN apk add --no-cache shellcheck

RUN mkdir /overlay
COPY root/ /overlay/
RUN find /overlay -type f | xargs shellcheck -e SC1008


FROM oznu/s6-alpine:3.11
LABEL maintainer="Jake Wharton <docker@jakewharton.com>"

ENV \
    # Fail if cont-init scripts exit with non-zero code.
    S6_BEHAVIOUR_IF_STAGE2_FAILS=2 \
    CRON="" \
    HEALTHCHECK_ID="" \
    PUID="" \
    PGID=""

RUN apk add --no-cache \
      isync \
      curl \
 && rm -rf /var/cache/* \
 && mkdir /var/cache/apk

COPY root/ /
