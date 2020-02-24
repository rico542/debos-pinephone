#!/bin/sh

USERNAME=$1

adduser --gecos $USERNAME --disabled-password --shell /bin/bash $USERNAME
adduser $USERNAME sudo

# Needed for hardware access rights
adduser $USERNAME video
adduser $USERNAME render
adduser $USERNAME audio
adduser $USERNAME bluetooth
adduser $USERNAME plugdev

echo "$USERNAME:1234" | chpasswd
echo "root:root" | chpasswd

mv /var/lib/AccountsService/users/USERNAME /var/lib/AccountsService/users/$USERNAME
sed -i -e "s/@@USERNAME@@/$USERNAME/" /etc/gdm3/daemon.conf

# Quick hack to allow the default user to access SMS
sed -i -e 's/auth_self_keep/yes/g' /usr/share/polkit-1/actions/org.freedesktop.ModemManager1.policy
