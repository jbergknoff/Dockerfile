# Project64

This lets you run Project64 in Wine in a container on Linux. Available from Docker Hub: https://hub.docker.com/r/jbergknoff/project64. Discussed in more depth: https://jonathan.bergknoff.com/journal/running-project64-in-docker/.

## Example usage

First, I make directories `mkdir -p ~/.config/project64/{config,save}`.

Then, on a computer with a NVIDIA graphics card and the NVIDIA drivers (version 440, if that matters) installed on the host system.

```sh
alias project64='docker run -it --rm \
	-v $XDG_RUNTIME_DIR/pulse/native:/run/user/1000/pulse/native -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
	--privileged -v /usr/lib/i386-linux-gnu:/nvidia-drivers -e LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu:/nvidia-drivers \
	-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
	-v ~/Games/N64:/home/wine/.wine/drive_c/N64 \
	-v ~/.config/project64/config:/home/wine/.wine/drive_c/Project64/Config \
	-v ~/.config/project64/save:/home/wine/.wine/drive_c/Project64/Save \
	--device /dev/input/js0 \
	jbergknoff/project64'
```

The image is, unfortunately, built with the specific user id 1000, and there are issues with PulseAudio socket access if the container uid doesn't match the host uid (i.e. the host user must also be 1000). There's probably some way to make this less brittle, but I don't know what that is, and it's good enough for me for the moment.

On a computer with no NVIDIA graphics card, slightly simpler:

```sh
alias project64='docker run -it --rm \
	-v $XDG_RUNTIME_DIR/pulse/native:/run/user/1000/pulse/native -e PULSE_SERVER=unix:/run/user/1000/pulse/native \
	-v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
	-v ~/Games/N64:/home/wine/.wine/drive_c/N64 \
	-v ~/.config/project64/config:/home/wine/.wine/drive_c/Project64/Config \
	-v ~/.config/project64/save:/home/wine/.wine/drive_c/Project64/Save \
	--device /dev/input/js0 \
	jbergknoff/project64'
```

Comments on the various flags below.

### Volumes

Inside the container, as far as Wine and Project64 are concerned, `/home/wine/.wine/drive_c` is accessible under `C:` while `/` is accessible under `Z:`.

The `Config` and `Save` volumes are useful to persist that data across runs (of course, if the installation goes south, run without those volumes, or wipe them out, to get back to a clean slate).

And you'll want to volume in your games, wherever they are, to wherever you want.

### X11 forwarding

```
-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix
```

### NVIDIA

Here's how I got OpenGL working with an NVIDIA card and a Debian/Ubuntu/Mint/etc. base system:

With the NVIDIA drivers installed on the host system, it's necessary to pass

```
--privileged -v /usr/lib/i386-linux-gnu:/nvidia-drivers -e LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu:/nvidia-drivers
```

I don't really know why `--privileged` is necessary, but I couldn't get things working without it.

I read about this trick of voluming in the NVIDIA driver on https://github.com/jessfraz/dockerfiles/issues/253#issuecomment-373043685. nvidia-docker is not necessary.

### PulseAudio

With PulseAudio installed on the host system (including the 32-bit versions), pass these arguments to Docker:

```
-e PULSE_SERVER=unix:/run/user/1000/pulse/native -v $XDG_RUNTIME_DIR/pulse/native:/run/user/1000/pulse/native
```

The 1000 here is specific to the user in the container (set in the Dockerfile). Unfortunately, this is pretty brittle. The file on the host system (`$XDG_RUNTIME_DIR/pulse/native`) also must be owned by uid 1000, or there are access control issues.

I had a lot of trouble getting audio to work when building the image from a Dockerfile (as opposed to running the steps manually in a container). The symptoms were that Wine would show no audio driver (`winecfg` would report `Selected Driver: (None)`) and Wine would always print this error when trying to do anything audio-related:

```
0016:err:ole:CoGetClassObject class {bcde0395-e52f-467c-8e3d-c4579291692e} not registered
0016:err:ole:CoGetClassObject no class object {bcde0395-e52f-467c-8e3d-c4579291692e} could be created for context 0x1
0016:err:dsound:get_mmdevenum CoCreateInstance failed: 80040154
```

There are several discussions about this on the internet, but none of them were relevant to what I was seeing. Ultimately I determined that Wine's `system.reg` was corrupt (or, at least, mostly empty when it shouldn't have been), and this was because running `wineboot` in a Dockerfile wasn't letting Wine's magical background processes do their work (because `wineboot` returns before the work is done, and Docker immediately, rightfully, terminates the container). I noticed the symptom, and the understanding came from [this GH issue](https://github.com/moby/moby/issues/12795) and [this GH issue](https://github.com/suchja/wine/issues/7). I worked around this by adding a `&& sleep 10` to the `wineboot` command in the Dockerfile. I hope other people trying to containerize specific Wine applications stumble upon this description and find it useful.

### Game controller

```
--device /dev/input/js0
```
