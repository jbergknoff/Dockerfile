FROM alpine:3.3
RUN apk update \
	&& apk add py-pip ca-certificates \
	&& apk add ffmpeg --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
	&& rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.08.28
ENTRYPOINT ["youtube-dl"]
