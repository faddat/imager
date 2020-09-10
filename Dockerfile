# This Dockerfile follows coinbase rosetta rules: https://www.rosetta-api.org/docs/node_deployment.html#dockerfile-expectations
# The coinbase rosetta guidelines seem like a good way of using Docker without security / audit / comprehensibility concerns.
# It does install Go as a binary, that seems out of scope here.
# This is a "fat" image.  It leaves all source code in place and is designed so that you can use it as a development environment if you'd like to.
# This also forms the basis for a bash script and a github action.

FROM ubuntu:20.04

MAINTAINER jacobgadikian@gmail.com


# INSTALL DEPENDENCIES
RUN apt update && \
	DEBIAN_FRONTEND="noninteractive" apt install -y ca-certificates git unzip wget qemu-user-static build-essential qemu-user-static ca-certificates dosfstools gdisk kpartx parted libarchive-tools sudo xz-utils psmisc

# INSTALL GO
RUN wget --progress=bar:force:noscroll https://golang.org/dl/go1.15.2.linux-amd64.tar.gz && \
	tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz

# GET GO CONFIGURED
ENV PATH=$PATH:/usr/local/go/bin

# INSTALL PACKER
RUN git clone https://github.com/hashicorp/packer --branch v1.5.5 && \
        cd packer && \
        go mod vendor && \
        go get . && \
        go install && \
        which packer

# PACKER-BUILDER-ARM
RUN git clone https://github.com//mkaczanowski/packer-builder-arm/ && \
        cd packer-builder-arm && \
        go mod download && \
        go install

# ENTRYPOINT
ENTRYPOINT packer build ubuntu.json
