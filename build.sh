#!/bin/#!/bin/sh

export PATH=/sbin:/usr/sbin:$PATH

debos rootfs.yaml &&
debos --scratchsize=8G image.yaml
