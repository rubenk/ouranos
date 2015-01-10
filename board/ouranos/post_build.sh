#!/bin/sh

target="$1"
rm -vf "${target}/etc/fstab"
rm -vf "${target}/etc/inittab"
rm -vf "${target}/etc/random-seed"
rm -vf "${target}/etc/securetty"
rm -rvf "${target}/etc/init.d/"
rm -rvf "${target}/etc/rc.d/"
rm -rvf "${target}/etc/network/"
rm -rvf "${target}/usr/share/bash-completion/"
rm -rvf "${target}/usr/share/zsh/"
rm -rvf "${target}/usr/lib/rpm/"
rm -rvf "${target}/usr/share/udhcpc/"
rm -vf "${target}/usr/bin/kernel-install"
rm -vf "${target}/usr/lib/libstdc++.so.6.0.20-gdb.py"

# don't build udev hwdb
rm -vf "${target}/lib/systemd/system/sysinit.target.wants/systemd-udev-hwdb-update.service"

# don't symlink /run to /tmp
rm -vf "$target}/run" && mkdir "${target}/run"
