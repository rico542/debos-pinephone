# debos-pinephone

A set of [debos](https://github.com/go-debos/debos) recipes for building a
debian-based image for the PinePhone.

A prebuilt image is available
[here](https://people.collabora.com/~aferraris/pinephone/debian-pinephone.img.gz),
as is the corresponding
[bmap](https://people.collabora.com/~aferraris/pinephone/debian-pinephone.img.bmap)
file.

## Build

To build the image, you need to have `debos` and `bmaptool`. On a debian-based
system, install these dependencies by typing the following command in a terminal:

```
sudo apt instal debos bmap-tools
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
- wifi connection
- web browsing

However, keep in mind this is a developer preview, and a number of features are
not yet implemented:

- phone calls and text messages
- sound support
- power management
- camera support

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
- [u-boot](https://gitlab.com/pine64-org/u-boot) and [arm-trusted-firmware](https://gitlab.com/pine64-org/arm-trusted-firmware), as provided by Pine64

#### Packages built from modified sources

- [libwlroots](https://gitlab.com/a-wai/wlroots), based on debian's [wlroots](https://salsa.debian.org/swaywm-team/wlroots)
- [phosh](https://gitlab.com/a-wai/phosh), based on Purism's [phosh](https://source.puri.sm/Librem5/phosh)
- [squeekboard](https://gitlab.com/a-wai/squeekboard), based on Purism's [squeekboard](https://source.puri.sm/Librem5/squeekboard)
- [plymouth-theme-pinephone](https://gitlab.com/a-wai/plymouth-theme-pinephone), based on Purism's [plymouth-theme-librem5](https://source.puri.sm/Librem5/plymouth-theme-librem5)
- [linux](https://gitlab.com/a-wai/linux-pinephone), based on Pine64's [kernel](https://gitlab.com/pine64-org/linux) and ayufan's [rtl8723cs](https://github.com/ayufan-pine64/rtl8723cs/) driver
- [firmware-rtl8723cs](https://gitlab.com/a-wai/firmware-rtl8723cs), based on anarsoul's [rtl8723bt-firmware](https://github.com/anarsoul/rtl8723bt-firmware/)

## TODO

- [ ] fix desktop background
- [ ] display splash screen in bootloader
- [ ] display splash screen during linux boot
- [ ] enable sound
- [ ] enable camera
- [ ] enable modem
- [ ] send/receive text messages
- [ ] send/receive phone calls
