## nodejs-builder

node.js environment, with git and build tools, to facilitate npm and bower installs.

* built on top of `gliderlabs/alpine` base image

Example usage:

Run `npm install` for current directory:

```bash
$ docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) jbergknoff/nodejs-builder npm install
> console.log("hello world!");
hello world!
```

Forward ssh-agent to fetch dependencies from, e.g., private git repositories:

```bash
$ docker run --rm \
	-v $(pwd):$(pwd) \
	-w $(pwd) \
	-v "$SSH_AUTH_SOCK":/ssh-agent \
	-e "SSH_AUTH_SOCK=/ssh-agent" \
	jbergknoff/nodejs-builder \
	sh -c "ssh -o StrictHostKeyChecking=no git@github.com; npm install"
```

This assumes that you are running ssh-agent and have an `SSH_AUTH_SOCK` environment variable on your docker host. The agent gets volumed in to the container at `/ssh-agent`. The `ssh` command preceding `npm install` skips the prompt to accept github's public SSH key, for better or worse.
