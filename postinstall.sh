#!/bin/bash

cp /root/xemubox-postinstall-scripts/box.xinitrc /mnt/home/box/.xinitrc
cp /root/xemubox-postinstall-scripts/box.bash_profile /mnt/home/box/.bash_profile

mkdir /mnt/etc/systemd/system/getty@tty1.service.d

cp /root/xemubox-postinstall-scripts/autologin.conf /mnt/etc/systemd/system/getty@tty1.service.d/autologin.conf
cp /root/xemubox-postinstall-scripts/linux-zen.preset /mnt/etc/mkinitcpio.d/linux-zen.preset
cp /root/xemubox-postinstall-scripts/cmdline /mnt/etc/kernel/cmdline
cp /root/xemubox-postinstall-scripts/mkinitcpio.conf /mnt/etc/mkinitcpio.conf

curl -sL -o /mnt/root/xbox.zip  https://github.com/K3V1991/Xbox-Emulator-Files/releases/latest/download/Xbox-Emulator-Files.zip

curl -sL -o /mnt/root/xbox_hdd.zip https://archive.org/download/xbox-hdd-image-with-original-dashboard/Xbox%20HDD%Image%20with%20Original%20Dashboard.zip

cd /mnt/root/

unzip xbox.zip
unzip xbox_hdd.zip

cp /mnt/root/mcpx /mnt/home/box -r
cp /mnt/root/bios /mnt/home/box -r

cp /root/xemubox-postinstall-scripts/mkinitcpio.conf /mnt/etc/mkinitcpio.conf

rm /mnt/root/mcpx -r
rm /mnt/root/bios -r
rm /mnt/root/hdd -r
rm /mnt/root/xbox.zip
rm /mnt/root/xbox_hdd.zip
rm /mnt/root/xbox_hdd.qcow2 

mkdir /mnt/home/box/hdd

cp /mnt/root/xbox_hdd.qcow2 /mnt/home/box/hdd/xbox_hdd.qcow2

cp /root/xemubox-postinstall-scripts/.config /home/box -r

arch-chroot /mnt

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

systemctl enable getty@tty1
systemctl enable dhcpcd

pacman --noconfirm -S linux-zen
