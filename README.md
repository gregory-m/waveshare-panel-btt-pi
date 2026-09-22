# Waveshare panel driver for BTT Pi

## How to build module:
```
make
```

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

