FROM alpine:3.1
RUN apk add --update py-pip ffmpeg ca-certificates && rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.03.18
ENTRYPOINT ["youtube-dl"]
