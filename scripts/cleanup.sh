#!/bin/sh

# Remove initrd as it has been converted to uImage
rm /boot/initrd.img

# Remove unnecessary .desktop files
rm /usr/share/applications/vim.desktop \
   /usr/share/applications/htop.desktop

# Remove apt packages which are no longer unnecessary and delete
# downloaded packages
apt -y autoremove
apt clean
