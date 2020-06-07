# Project64

## Example usage

Here's how I use this on a computer with

### Volumes

Volume in some locations to persist the data across runs (of course, if the installation goes south, run without those volumes, or wipe them out, to get back to a clean slate).

I make directories `mkdir -p ~/.config/project64/{config,save}` and then

```
-v ~/.config/project64/config:/home/wine/.wine/drive_c/Program\ Files/Project64\ 2.3/Config \
-v ~/.config/project64/save:/home/wine/.wine/drive_c/Program\ Files/Project64\ 2.3/Save
```

Volume in your games, wherever they are.

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

This works for me on one of my computers (Linux Mint 19.3 host), but actually not on another of my computers (also Mint 19.3), and I don't know why. Running a game in Project64 fails with

```
$ wine Project64.exe
0010:err:ole:marshal_object couldn't get IPSFactory buffer for interface {00000131-0000-0000-c000-000000000046}
0010:err:ole:marshal_object couldn't get IPSFactory buffer for interface {6d5140c1-7436-11ce-8034-00aa006009fa}
0010:err:ole:StdMarshalImpl_MarshalInterface Failed to create ifstub, hres=0x80004002
0010:err:ole:CoMarshalInterface Failed to marshal the interface {6d5140c1-7436-11ce-8034-00aa006009fa}, 80004002
0010:err:ole:get_local_server_stream Failed: 80004002
0012:fixme:ver:GetCurrentPackageId (0xeefefc (nil)): stub
0009:fixme:resource:DestroyAcceleratorTable other process handle 0x1?
0009:fixme:sync:NtSetTimerResolution (10000,1,0x32cb44), stub!
0009:fixme:dinput:IDirectInputDevice2AImpl_EnumEffects 0xc7e588)->(0xa62680,0xa9f110,0x00000000): stub!
libGL error: MESA-LOADER: failed to retrieve device information
libGL error: Version 4 or later of flush extension not found
libGL error: failed to load driver: i915
libGL error: failed to open drm device: No such file or directory
libGL error: failed to load driver: i965
packed pixels extension used
NPOT extension used
use_fbo 0
0016:err:ole:CoGetClassObject class {bcde0395-e52f-467c-8e3d-c4579291692e} not registered
0016:err:ole:CoGetClassObject no class object {bcde0395-e52f-467c-8e3d-c4579291692e} could be created for context 0x1
0016:err:dsound:get_mmdevenum CoCreateInstance failed: 80040154
```

Wine isn't picking out an audio driver (as seen in `winecfg`, which reports "Selected Driver: (None)") and can't be persuaded otherwise.

### Game controller

```
--device /dev/input/js0
```
