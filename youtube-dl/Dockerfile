FROM alpine:3.2
RUN apk add --update py-pip ca-certificates ffmpeg && rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.10.12
ENTRYPOINT ["youtube-dl"]
