#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH

debos -m 4G rootfs.yaml &&
debos -m 4G --scratchsize=8G image.yaml
