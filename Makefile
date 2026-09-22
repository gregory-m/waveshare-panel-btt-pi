KDIR ?= /lib/modules/$(shell uname -r)/build

.PHONY: all module clean

all: module

module:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)/module" modules

clean:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)/module" clean
