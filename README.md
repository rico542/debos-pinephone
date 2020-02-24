# debos-pinephone

A set of [debos](https://github.com/go-debos/debos) recipes for building a
debian-based image for the PinePhone.

A prebuilt image is available
[here](http://pinephone.a-wai.com/images/debian-pinephone.img.gz),
as is the corresponding
[bmap](http://pinephone.a-wai.com/images/debian-pinephone.img.bmap)
file.

## Build

To build the image, you need to have `debos` and `bmaptool`. On a debian-based
system, install these dependencies by typing the following command in a terminal:

```
sudo apt install debos bmap-tools
```

Then simply browse to the `debos-pinephone` folder and execute `./build.sh`.

## Install

Insert a MicroSD card into your computer, and type the following command:

```
sudo bmaptool copy debian-pinephone.img /dev/<sdcard>
```

or:

```
sudo dd if=debian-pinephone.img of=/dev/<sdcard> bs=1M
```

*Note: Make sure to use your actual SD card device, such as `mmcblk0` instead of
`<sdcard>`.*

**CAUTION: This will format the SD card and erase all its contents!!!**

## What works, what doesn't

The folowing features work, at least most of the time:

- UART console
- touchscreen
- graphics acceleration
- wifi connection
- web browsing
- text messaging
- sound playback

However, keep in mind this is a developer preview, and a number of features are
not yet implemented:

- full sound support
- voice calls
- power management
- camera support
- bluetooth

## Included software

The generated image include, among others, the following packages:

- [Epiphany](https://gitlab.gnome.org/GNOME/epiphany) web browser
- [Chatty](https://source.puri.sm/Librem5/chatty), a test messaging app with XMPP/OMEMO support
- [2048](https://source.puri.sm/Librem5/gnome-2048), a simple game
- [King's Cross](https://gitlab.gnome.org/ZanderBrown/kgx), a terminal emulator
- [Clocks](https://source.puri.sm/Librem5/gnome-clocks) application
- [Settings](https://source.puri.sm/Librem5/gnome-control-center) application
- [Usage](https://source.puri.sm/Librem5/gnome-usage), a system monitor
- [Squeekboard](https://gitlab.com/a-wai/squeekboard) virtual keyboard

Most packages installed on this image are fetched directly from the debian
archives. However, a few packages (included in binary form in this repo) had to
be rebuilt with various levels of modifications. Here is the full list:

#### Packages built from upstream sources

- [phoc](https://source.puri.sm/Librem5/phoc)
- [kgx](https://gitlab.gnome.org/ZanderBrown/kgx)
- [chatty](https://source.puri.sm/Librem5/chatty)

#### Packages built from third-party-modified sources

- [gnome-2048](https://source.puri.sm/Librem5/gnome-2048), as modified by Purism
- [gnome-clocks](https://source.puri.sm/Librem5/gnome-clocks), as modified by Purism
- [gnome-control-center](https://source.puri.sm/Librem5/gnome-control-center), as modified by Purism
- [gnome-usage](https://source.puri.sm/Librem5/gnome-usage), as modified by Purism
- [purple-lurch](https://source.puri.sm/Librem5/lurch), as modified by Purism
- [arm-trusted-firmware](https://gitlab.com/pine64-org/arm-trusted-firmware), as provided by Pine64

#### Packages built from modified sources

- [libwlroots](https://gitlab.com/a-wai/wlroots), based on debian's [wlroots](https://salsa.debian.org/swaywm-team/wlroots)
- [desktop-base](https://gitlab.com/a-wai/desktop-base), based on debian's [desktop-base](https://salsa.debian.org/debian-desktop-team/desktop-base)
- [phosh](https://gitlab.com/a-wai/phosh), based on Purism's [phosh](https://source.puri.sm/Librem5/phosh)
- [squeekboard](https://gitlab.com/a-wai/squeekboard), based on Purism's [squeekboard](https://source.puri.sm/Librem5/squeekboard)
- [linux](https://gitlab.com/a-wai/linux-pinephone), based on Pine64's [kernel](https://gitlab.com/pine64-org/linux) and ayufan's [rtl8723cs](https://github.com/ayufan-pine64/rtl8723cs/) driver
- [powersupply](https://gitlab.com/a-wai/powersupply), based on Martijn Braam's [powersupply](https://gitlab.com/MartijnBraam/powersupply)
- [firmware-rtl8723cs](https://gitlab.com/a-wai/firmware-rtl8723cs), based on anarsoul's [rtl8723bt-firmware](https://github.com/anarsoul/rtl8723bt-firmware/)
- [u-boot](https://gitlab.com/a-wai/u-boot), based on Pine64's [u-boot](https://gitlab.com/pine64-org/u-boot)

## TODO

- [x] fix desktop background
- [x] enable sound
- [x] enable modem
- [x] enable graphics acceleration
- [x] send/receive text messages
- [x] display splash screen during linux boot
- [ ] switch sound output when (un)plugging the headphones
- [ ] send/receive voice calls
- [ ] enable camera
- [ ] display splash screen in bootloader (unlikely, as u-boot lacks support for Mali 450)
