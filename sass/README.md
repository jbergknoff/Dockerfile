## sass

SASS/SCSS compiler

* built on top of `alpine` base image
* uses [sassc](https://github.com/sass/sassc)
* ~9 MB in size (5 MB alpine base + 4 MB sassc binary)

## Usage

The image has the `sass` binary as its entrypoint, so it should be invoked with whatever arguments you would normally pass to sass. For example,

```bash
$ cat file.scss
$blue: #00f;
.thing { color: $blue; }
$ docker run --rm -v $(pwd):$(pwd) -w $(pwd) jbergknoff/sass file.scss
.thing {
  color: #00f; }
```

You may also want to create a bash alias:

```bash
alias sass="docker run -it --rm -v \$(pwd):\$(pwd) -w \$(pwd) jbergknoff/sass"
```

so you will be able to simply run

```
$ sass file.scss
.thing {
  color: #00f; }
```

## Generating the binary

The binary is compiled as part of the Dockerfile, and the build tools are subsequently removed.
