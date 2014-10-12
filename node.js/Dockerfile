FROM debian:wheezy

RUN apt-get update && apt-get install -y wget=1.13.4-3+deb7u1

ENV NODE_VERSION 0.10.32
RUN wget -qO - http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz \
	| tar zxf - \
	&& ln -s /node-v$NODE_VERSION-linux-x64/bin/node /usr/bin \
	&& ln -s /node-v$NODE_VERSION-linux-x64/bin/npm /usr/bin
