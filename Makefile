KVER    ?= $(shell uname -r)
KDIR    ?= /lib/modules/$(KVER)/build
SRC     := $(CURDIR)/module
MODULE  := panel-waveshare-dsi.ko
MODDIR  := /lib/modules/$(KVER)/updates
OVERLAY ?= $(CURDIR)/overlay/panel-waveshare-dsi.dts

.PHONY: all module install uninstall clean

all: module

module:
	$(MAKE) -C "$(KDIR)" M="$(SRC)" modules

clean:
	$(MAKE) -C "$(KDIR)" M="$(SRC)" clean

install:
	@test -f "$(SRC)/$(MODULE)" || { echo "$(MODULE) not built - run 'make' first"; exit 1; }
	install -D -m 644 "$(SRC)/$(MODULE)" "$(MODDIR)/$(MODULE)"
	depmod -a $(KVER)
	armbian-add-overlay "$(OVERLAY)"

uninstall:
	rm -f "$(MODDIR)/$(MODULE)"
	depmod -a $(KVER)
	@echo "Don't forget to remove panel-waveshare-dsi from user_overlays in /boot/armbianEnv.txt"

