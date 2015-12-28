## s3rver

Fake S3 server for testing purposes

* built on top of `mhart/alpine-node` base image
* [![](https://badge.imagelayers.io/jbergknoff/s3rver:latest.svg)](https://imagelayers.io/?images=jbergknoff/s3rver:latest 'Get your own badge on imagelayers.io')
* listens on port 5000, stores data in `/tmp` (TODO)

### Example usage:

```bash
$ docker run -d jbergknoff/s3rver
```
