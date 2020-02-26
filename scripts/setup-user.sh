#!/bin/sh

USERNAME=$1
[ "$USERNAME" ] || exit 1
PASSWORD=$2
[ "$PASSWORD" ] || exit 1

adduser --gecos $USERNAME --disabled-password --shell /bin/bash $USERNAME
adduser $USERNAME sudo

# Needed for hardware access rights
adduser $USERNAME video
adduser $USERNAME render
adduser $USERNAME audio
adduser $USERNAME bluetooth
adduser $USERNAME plugdev

echo "$USERNAME:$PASSWORD" | chpasswd
echo "root:root" | chpasswd

mv /var/lib/AccountsService/users/USERNAME /var/lib/AccountsService/users/$USERNAME
sed -i -e "s/@@USERNAME@@/$USERNAME/" /etc/gdm3/daemon.conf
