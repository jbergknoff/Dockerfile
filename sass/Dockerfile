FROM alpine:3.1
ADD build.sh /usr/bin/
RUN build.sh

ADD test.sh /tmp/
RUN /tmp/test.sh

ENTRYPOINT [ "sass" ]
