FROM alpine:3.3
ENV EDGE_REPOSITORY=http://dl-cdn.alpinelinux.org/alpine/edge/main
RUN apk update --repository $EDGE_REPOSITORY \
	&& apk add py-pip ca-certificates \
	&& apk add ffmpeg --repository $EDGE_REPOSITORY \
	&& rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.08.28
ENTRYPOINT ["youtube-dl"]
