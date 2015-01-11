#!/usr/bin/env bash

IMG=${BINARIES_DIR}/rootfs.ext4

# TODO: do this without sudo
sudo mkdir -p /tmp/bla
sudo mount -o loop ${IMG} /tmp/bla
sudo ${HOST_DIR}/sbin/extlinux -i /tmp/bla/boot/syslinux/
sudo umount /tmp/bla
sudo rmdir /tmp/bla
