#!/bin/sh

# Remove initrd as it has been converted to uImage
rm -f /boot/initrd.img

# Remove unnecessary .desktop files
rm -f /usr/share/applications/vim.desktop \
      /usr/share/applications/htop.desktop

# Remove apt packages which are no longer unnecessary and delete
# downloaded packages
apt -y autoremove --purge
apt clean

# Remove SSH keys and machine ID so they get generated on first boot
rm -f /etc/ssh/ssh_host_* \
      /etc/machine-id

# Disable getty on tty1, as we won't connect in console mode anyway
systemctl disable getty@.service

# FIXME: these are automatically installed on first boot, and block
# the system startup for over 1 minute! Find out why this happens and
# avoid this nasty hack
rm -f /lib/systemd/system/wpa_supplicant@.service \
      /lib/systemd/system/wpa_supplicant-wired@.service \
      /lib/systemd/system/wpa_supplicant-nl80211@.service
