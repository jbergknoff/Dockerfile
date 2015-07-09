FROM alpine:3.2
RUN apk add --update py-pip ffmpeg ca-certificates && rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.07.07
ENTRYPOINT ["youtube-dl"]
