# Imager
Github action for making embedded device images from a bash script

Imager takes care of the operating system and device image.

Your bash script takes care of configuration and putting things in the right place in the filesystem.  

Imager is shipped as a bash script, too, for those who would prefer to run it on their own hardware. 

## Imager stack

* Ubuntu 20.04
* packer
* packer-builder-arm
* qemu
* pishrink