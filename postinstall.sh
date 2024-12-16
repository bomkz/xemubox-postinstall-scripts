#!/bin/bash

set -e

cp /root/xemubox-postinstall-scripts/box.xinitrc /mnt/archinstall/home/box/.xinitrc
cp /root/xemubox-postinstall-scripts/box.bash_profile /mnt/archinstall/home/box/.bash_profile

cp /root/xemubox-postinstall-scripts/on-wakeup.sh /mnt/archinstall/root/on-wakeup.sh
cp /root/xemubox-postinstall-scripts/wake-up.service /mnt/archinstall/etc/systemd/system/wake-up.service

cp /etc/pacman.conf /mnt/archinstall/etc/pacman.conf

mkdir /mnt/archinstall/etc/systemd/system/getty@tty1.service.d

cp /root/xemubox-postinstall-scripts/autologin.conf /mnt/archinstall/etc/systemd/system/getty@tty1.service.d/autologin.conf
cp /root/xemubox-postinstall-scripts/linux-zen.preset /mnt/archinstall/etc/mkinitcpio.d/linux-zen.preset
cp /root/xemubox-postinstall-scripts/cmdline /mnt/archinstall/etc/kernel/cmdline
cp /root/xemubox-postinstall-scripts/mkinitcpio.conf /mnt/archinstall/etc/mkinitcpio.conf
cp /root/xemubox-postinstall-scripts/box.local/ /mnt/archinstall/home/box/.local -r

curl -sL -o /mnt/archinstall/root/xbox.zip  https://github.com/K3V1991/Xbox-Emulator-Files/releases/latest/download/Xbox-Emulator-Files.zip

curl -L https://archive.org/download/ia-pex/ia > /tmp/ia
chmod +x /tmp/ia
cd /mnt/archinstall/root/
/tmp/ia download xbox-hdd-image-with-original-dashboard
cp /mnt/archinstall/root/xbox-hdd-image-with-original-dashboard/Xbox\ HDD\ Image\ with\ Original\ Dashboard.zip /mnt/archinstall/root/xbox_hdd.zip
cd /mnt/archinstall/root/

unzip xbox.zip
unzip xbox_hdd.zip


cp /mnt/archinstall/root/mcpx /mnt/archinstall/home/box -r
cp /mnt/archinstall/root/bios /mnt/archinstall/home/box -r

cp /root/xemubox-postinstall-scripts/logind.conf /mnt/archinstall/etc/systemd/logind.conf
cp /root/xemubox-postinstall-scripts/01-on-wake.sh /mnt/archinstall/usr/lib/systemd/system-sleep/01-on-wake.sh
chmod +x /mnt/archinstall/usr/lib/systemd/system-sleep/01-on-wake.sh

mkdir /mnt/archinstall/home/box/hdd
cp /mnt/archinstall/root/xbox_hdd.qcow2 /mnt/archinstall/home/box/hdd/xbox_hdd.qcow2


rm /mnt/archinstall/root/mcpx -r
rm /mnt/archinstall/root/bios -r
rm /mnt/archinstall/root/hdd -r
rm /mnt/archinstall/root/xbox_hdd.qcow2 

cp /root/xemubox-postinstall-scripts/install.sh /mnt/archinstall/root/install.sh

arch-chroot /mnt/archinstall /root/install.sh
