# Waveshare panel driver for BTT Pi

## Сompatibility
Driver tested only on [2.8inch panel](https://www.waveshare.com/product/raspberry-pi/displays/2.8inch-dsi-lcd.htm) and it neeeded to change DSI video moode to burst (MIPI_DSI_MODE_VIDEO_BURST) to fix picture wrap and wrong colors. If you see such artifcats on you panel after loading module you can try to add `MIPI_DSI_MODE_VIDEO_BURST` to your panel `ws_panel_data` and submit issue/PR if it fixes artifacts.

## How to build and install module module:
```
curl -L -o /tmp/linux-headers-btt-rockchip64_3.1.0-26.08.0-trunk_arm64__6.1.115.deb https://github.com/gregory-m/waveshare-panel-btt-pi/releases/download/v0.0.1/linux-headers-btt-rockchip64_3.1.0-26.08.0-trunk_arm64__6.1.115-S4b20-Dcb6e-P09c0-C908f-H94f2-HK01ba-Vc222-Bfe95-R448a.deb
sudo apt install /tmp/linux-headers-btt-rockchip64_3.1.0-26.08.0-trunk_arm64__6.1.115.deb

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

