#!/usr/bin/env bash

IMG=${BINARIES_DIR}/rootfs.ext4
TMPDIR=$(mktemp -d)

# TODO: do this without sudo
sudo mount -o loop ${IMG} ${TMPDIR} && \
	sudo ${HOST_DIR}/sbin/extlinux -i ${TMPDIR}/boot/syslinux/ && \
	sudo umount ${TMPDIR} && \
	sudo rmdir ${TMPDIR}
