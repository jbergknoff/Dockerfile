## sass

SASS/SCSS compiler

* built on top of `debian` base image
* uses [sassc](https://github.com/sass/sassc)
* ~88 MB in size (85 MB debian base + 3 MB sassc binary)
* invoke with `docker run --rm -v $(pwd):$(pwd) -w $(pwd) jbergknoff/sass file.scss`

## Generating the binary

I compiled the `sassc` binary in a docker container and then uploaded it to dropbox in order to keep this image as small as possible (i.e. excluding the build tools). The procedure was as follows:

```
HOST
$ git clone git@github.com:sass/sassc
$ cd sassc && git clone git@github.com:sass/libsass
$ docker run -it --rm -v $(pwd):/sass debian:wheezy
CONTAINER
# apt-get update && apt-get install -y build-essential
# cd sass
# SASS_LIBSASS_PATH=/sass/libsass make
```

At this point, the binary is located on the host at `$(pwd)/bin/sassc`.
