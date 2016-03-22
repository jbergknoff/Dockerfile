# The purpose of this image is to run npm/bower installs
FROM mhart/alpine-node:4.4.0
RUN apk-install build-base=0.3-r0 git=2.2.1-r0 openssh-client=6.7_p1-r0
RUN npm install -g bower
