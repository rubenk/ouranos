#!/bin/sh

target="$1"
rm -vf "${target}/etc/fstab"
rm -vf "${target}/etc/inittab"
rm -rvf "$target}/etc/init.d"
rm -rvf "$target}/etc/rc.d/init.d"
