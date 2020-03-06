#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH
IMG_FILE="debian-pinephone-`date +%Y%m%d`.img"
ARGS=
image_only=
do_compress=
username=
password=

while getopts "izup:h:f:" opt
do
  case "$opt" in
    i ) image_only=1 ;;
    z ) do_compress=1 ;;
    u ) username="$OPTARG" ;;
    p ) password="$OPTARG" ;;
    h ) http_proxy="$OPTARG" ;;
    f ) ftp_proxy="$OPTARG" ;;
  esac
done

if [ "$username" ]; then
  ARGS="$ARGS -t username:\"$username\""
fi

if [ "$password" ]; then
  ARGS="$ARGS -t password:\"$password\""
fi

if [ "$http_proxy" ]; then
  ARGS="$ARGS -e http_proxy:\"$http_proxy\""
fi

if [ "$ftp_proxy" ]; then
  ARGS="$ARGS -e ftp_proxy:\"$ftp_proxy\""
fi

ARGS="$ARGS --scratchsize=8G"

if [ ! "$image_only" ]; then
  debos $ARGS bootstrap.yaml || exit 1
fi
debos $ARGS -t image:$IMG_FILE image.yaml

if [ "$do_compress" ]; then
  echo "Compressing $IMG_FILE..."
  gzip --keep --force $IMG_FILE
fi
