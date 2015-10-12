FROM alpine:3.2
ENV EDGE_REPOSITORY "http://dl-4.alpinelinux.org/alpine/edge/main/"
RUN apk update --repository $EDGE_REPOSITORY \
	&& apk add py-pip ca-certificates \
	&& apk add ffmpeg --repository $EDGE_REPOSITORY \
	&& rm -rf /var/cache/apk/*
RUN pip install youtube-dl==2015.10.12
ENTRYPOINT ["youtube-dl"]
