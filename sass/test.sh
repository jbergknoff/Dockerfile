#!/bin/sh
echo --- Tests ---

echo -n "it should install sassc 3.2.1... "
sass -v | grep sassc | grep "3.2.1" > /dev/null
[ "$?" -ne 0 ] && echo nope && exit 1
echo ok

echo -n "it should compile SCSS... "
echo '$blue: #00f; .thing { color: $blue; }' > /tmp/test.scss
sass /tmp/test.scss | grep "color: #00f" > /dev/null
[ "$?" -ne 0 ] && echo nope && exit 1
rm /tmp/test.scss
echo ok
