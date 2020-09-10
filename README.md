# Imager
Github action for making device images from a bash script called `image.bash`

Imager takes care of the operating system and device image.

Your bash script takes care of configuration and putting things in the right place in the filesystem.  

Imager is shipped as a bash script for those who prefer to run it on their own hardware, as a GitHub atction for those who would like to run it on GitHub, and as a Docker image for those who want to run it real fast-like. 

## v1 features

* Ubuntu 20.04 server image for rpi 4
* Consumes a bash script-- your repo must have a file named `image.bash` in it
  * Your bash script runs in a chroot, and 

## Stack

* Ubuntu 20.04
* packer
* packer-builder-arm
* qemu
* pishrink


## Future Features

**Smaller Images**

Images are currently needlessly large, and Ubuntu is just pretend Debian.  Later we will use packer-builder-arm to generate images from scratch-- when we've figured out how to, that is :).

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
with
  earth: true
```

**Hardware**

Sooner than later, this setup will be able to build device images for an open source Router and Single Board Computer being designed by [pcbviet.coom](https://pcbviet.com).  I think this is the [best way](https://xkcd.com/927/) to make device images, and soon hardware mated to this flow will exist, as well.  

**Docker Use**

This coould run faster if it used docker, so maybe it will. 

## Sponsorship and Acknowledgements
The R&D work that made this possible is funded by [Tenderrmint, Inc](https://tendermint.com).  I'm deeply grateful for their support in this endeavor. 

@mkaczanowski's work on [packer-builder-arm](https://github.com/mkaczanowski/packer-builder-arm) made this possible. 

