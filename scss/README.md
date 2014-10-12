## scss

SCSS compiler

* built on top of `debian` base image
* uses [python-scss](http://pythonhosted.org/scss/)
* ~118 MB in size (85 MB debian base + 33 MB python stuff)
* invoke with `docker run --rm -v $(pwd):$(pwd) -w $(pwd) jbergknoff/scss file.scss`
