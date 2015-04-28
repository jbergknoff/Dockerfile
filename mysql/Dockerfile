FROM alpine:3.1
RUN apk --update add mysql mysql-client && rm -rf /var/cache/apk/*
RUN mysql_install_db --user=mysql -ldata=/var/lib/mysql
ADD entrypoint.sh /usr/bin/
EXPOSE 3306
ENTRYPOINT [ "entrypoint.sh" ]
