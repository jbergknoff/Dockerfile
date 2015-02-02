## node.js

Minimal node.js environment:

* built on top of `gliderlabs/alpine` base image
* ~17 MB in size (5 MB base + 12 MB)
* executes `node` by default

Example usage:

```bash
$ docker run -it --rm jbergknoff/nodejs
> console.log("hello world!");
hello world!
```

```bash
$ ls
index.js
$ docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) jbergknoff/nodejs node index.js
...script output...
```
