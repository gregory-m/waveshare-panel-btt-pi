# Waveshare panel driver for CB2 / BTT Pi 2

## Сompatibility
Driver tested only on [2.8inch panel](https://www.waveshare.com/product/raspberry-pi/displays/2.8inch-dsi-lcd.htm) and it neeeded to change DSI video moode to burst (MIPI_DSI_MODE_VIDEO_BURST) to fix picture wrap and wrong colors. If you see such artifcats on you panel after loading module you can try to add `MIPI_DSI_MODE_VIDEO_BURST` to your panel `ws_panel_data` and submit issue/PR if it fixes artifacts.

## Installation
Download the deb package from the "Releases" page and install it with apt:
```
sudo apt install panel-waveshare-dsi_*.deb
```

## Building from source

### How to build and install the module
Download the headers deb package from the "Releases" page and install it with apt:
```
sudo apt install linux-headers-btt-rockchip64_*.deb
```
Then build and install the module:
```
make
sudo make install
```

## How to build deb package:
```
dpkg-buildpackage -us -uc -b
sudo apt install ../panel-waveshare-dsi_0.1.0_arm64.deb
```
Package version comes from `debian/changelog` update it before relasing new version.

## How to create kernel headers:
Bigtreetech [doesn't includes kernel headers](https://github.com/bigtreetech/CB1/issues/209) in their armbian distribution, this makes creating off the tree kernel module very hard task. Also their compile script produces kernel headers package its just not installed on target OS.

#### Build on ubuntu machine build kernel and copy to board:
```
git clone https://github.com/bigtreetech/build.git
cd build
git checkout bpi-main-26.08.0

./compile.sh kernel \
  BOARD=bigtreetech-cb2 \
  BRANCH=btt \
  KERNEL_CONFIGURE=no \
  ARTIFACT_IGNORE_CACHE=yes

scp output/debs/linux-headers-btt-*.deb <btt-pi>
```

#### linux-headers-btt releases.
To make things easier I uploaded headers to releases page. You can use download deb package from releases page and use it for development.

