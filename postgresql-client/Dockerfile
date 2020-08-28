FROM alpine:3.12
RUN apk --update add postgresql-client && rm -rf /var/cache/apk/*
ENTRYPOINT [ "psql" ]
