#!/bin/sh

target="$1"
rm -vf "${target}/etc/fstab"
rm -rvf "${target}/etc/init.d/"
rm -rvf "${target}/etc/rc.d/"
rm -rvf "${target}/etc/network/"
rm -rvf "${target}/usr/lib/rpm/"
rm -vf "${target}/usr/bin/kernel-install"

# don't build udev hwdb
rm -vf "${target}/lib/systemd/system/sysinit.target.wants/systemd-udev-hwdb-update.service"

# don't symlink /run to /tmp
rm -rvf "${target}/run" && mkdir "${target}/run"
rm -rvf "${target}/var/run" && ln -vs "../run" "${target}/var/run"
rm -rvf "${target}/var/log" && mkdir "${target}/var/log"
rm -rvf "${target}/var/spool" && mkdir "${target}/var/spool"
rm -rvf "${target}/var/lock" && mkdir "${target}/var/lock"
rm -rvf "${target}/var/cache" && mkdir "${target}/var/cache"

# make sure /tmp is empty
rm -rvf "${target}/tmp/dbus"
rm -rvf "${target}/tmp/journal"
rm -rvf "${target}/tmp/ldconfig"
rm -vf  "${target}/tmp/README"

# volatile journal
sed -i 's/^#Storage=auto/Storage=volatile/' "${target}/etc/systemd/journald.conf"

cp ${BINARIES_DIR}/syslinux/menu.c32 "${target}/boot/syslinux/"
cp ${BINARIES_DIR}/syslinux/libutil.c32 "${target}/boot/syslinux/"
