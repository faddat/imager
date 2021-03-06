# Imager

Imager is a Github action, bash script, and Docker image for making Ubuntu 20.04 device images from a bash script called `image.bash`

Imager takes care of the operating system and device image.

Your bash script takes care of configuration and putting things in the right place in the filesystem.  

Imager is shipped as a bash script for those who prefer to run it on their own hardware, as a GitHub atction for those who would like to run it on GitHub, and as a Docker image for those who want to run it real fast-like. 

The image is designed for headless use, and has an ssh server at port 22.  Username is ubuntu and passwoord is ubuntu.  It'll prompt you to change these after the first login.  

## How to use it

Put this in a [repoository](https://github.com/faddat/device-image-test) with an `image.bash` file in it root.  That's it. 

Here is a sample workflow that you can copy-paste into .github/workflows/name-your-image.yml

```yaml
name: My Pi Image
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: faddat/imager@v1
    - name: Shrink The Device Image
      run: sudo pishrink.sh -a -Z -v ubuntu-20.04.img
    - name: Upload artifacts
      uses: actions/upload-artifact@v2
      with:
        name: Your Pi Image
        path: ubuntu-20.04.img.xz
```

## v1 features

* Ubuntu 20.04 server image for rpi 4
* Consumes a bash script-- your repo must have a file named `image.bash` in its root.  Here is an example: [device-image-test](https://github.com/faddat/device-image-test)
  * Your bash script runs in a chroot, and can configure the device.  For now, you cannot do apt-get upgrade, but everything else I've tried has worked.  

## Stack

* Ubuntu 20.04
* packer
* packer-builder-arm
* qemu
* pishrink


## Future Features

These are my ideas, but I very much welcome feature requests!  Please let me know what you'd like to see!

**Smaller Images**

Images are currently needlessly large, Ubuntu is just pretend Debian, and Arch is the best.  Later we will use packer-builder-arm to generate images from scratch-- when we've figured out how to, that is :).

* pacstrap -> Arch Linux
* debootstrap -> debian

**More Device Build Targets**

There's really no reason that this setup can't build for more devices, in matrices, even.  This will probably become a 

```
with:
  all-devices: true
```

and

```
with:
  devices: [raspberry-pi-3, raspberrry-pi-4]
```

**ZeroTier**

ZeroTier networks let everyone in the world be just one hop away from each other.  Future editions may make joining `earth` at boot time as easy as:

```
with:
  earth: true
```

and

```
with:
  zerotier-network: e4da7455b26d23be
```

**Hardware**

Sooner than later, this setup will be able to build device images for an open source Router and Single Board Computer being designed by [pcbviet.com](https://pcbviet.com).  I think this is the [best way](https://xkcd.com/927/) to make device images, and soon hardware mated to this flow will exist, as well.  

**Docker Use**

This coould run faster if it used docker, so maybe it will. 

## Sponsorship and Acknowledgements
The R&D work that made this possible is funded by [Tendermint, Inc](https://tendermint.com).  I'm deeply grateful for their support in this endeavor. 

@mkaczanowski 's work on [packer-builder-arm](https://github.com/mkaczanowski/packer-builder-arm) made this possible. 

