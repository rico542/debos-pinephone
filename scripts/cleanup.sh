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
