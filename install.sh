#!/bin/bash

set -e

chown box /home/box/.xinitrc 
chown box /home/box/.bash_profile

chmod a+rwx /home/box/.xinitrc
chmod a+rwx /home/box/.bash_profile

chown box /home/box/.local
chown box /home/box/.local/share
chown box /home/box/.local/share/xemu
chown box /home/box/.local/share/xemu/xemu
chown box /home/box/.local/share/xemu/xemu/xemu.toml

chmod a+rwx /home/box/.local
chmod a+rwx /home/box/.local/share
chmod a+rwx /home/box/.local/share/xemu
chmod a+rwx /home/box/.local/share/xemu/xemu
chmod a+rwx /home/box/.local/share/xemu/xemu/xemu.toml

chown box /home/box/hdd/xbox_hdd.qcow2
chown box /home/box/hdd
chown box /home/box/mcpx/mcpx_1.0.bin
chown box /home/box/mcpx
chown box /home/box/bios/Complex_4627.bin
chown box /home/box/bios

chmod a+rwx /home/box/hdd/xbox_hdd.qcow2
chmod a+rwx /home/box/hdd
chmod a+rwx /home/box/mcpx/mcpx_1.0.bin
chmod a+rwx /home/box/mcpx
chmod a+rwx /home/box/bios/Complex_4627.bin
chmod a+rwx /home/box/bios

chmod a+rwx /root/on-wakeup.sh

systemctl enable getty@tty1
systemctl enable dhcpcd
systemctl enable wake-up.service

pacman --noconfirm -S linux-zen
