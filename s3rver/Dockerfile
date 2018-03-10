FROM mhart/alpine-node:6.13.1
RUN npm install -g s3rver@2.2.1
EXPOSE 5000
CMD [ "s3rver", "--hostname", "0.0.0.0", "--port", "5000", "--directory", "/tmp" ]
