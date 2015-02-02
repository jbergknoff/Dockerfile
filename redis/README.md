## redis

Minimal redis environment:

* built on top of `gliderlabs/alpine` base image
* ~6 MB in size (5 MB base + 1 MB)
* executes `redis-server` by default.

Example usage:

```bash
$ docker run -d jbergknoff/redis
```
