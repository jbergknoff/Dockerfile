#!/bin/sh

INITFILE=/tmp/init.sql
touch $INITFILE

if [ -n $ROOT_PASSWORD ]; then
  echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD'" >> $INITFILE
fi

if [ -n "$USERNAME" ] then
  echo "GRANT ALL ON *.* TO '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD'" >> $INITFILE
fi

mysqld_safe --init-file=$INITFILE
