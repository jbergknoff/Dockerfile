FROM debian:wheezy

RUN apt-get update \
	&& apt-get install -y python-setuptools=0.6.24-1 \
	&& rm -rf /var/lib/apt/lists/*

RUN easy_install scss
ENTRYPOINT [ "scss" ]
