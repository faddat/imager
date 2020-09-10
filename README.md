# Imager
Github action for making device images from a bash script

Imager takes care of the operating system and device image.

Your bash script takes care of configuration and putting things in the right place in the filesystem.  

Imager is shipped as a bash script for those who prefer to run it on their own hardware, as a GitHub atction for those who would like to run it on GitHub, and as a Docker image for those who want to run it real fast-like. 

## Imager stack

* Ubuntu 20.04
* packer
* packer-builder-arm
* qemu
* pishrink
