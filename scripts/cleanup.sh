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
systemctl disable getty@tty1.service
