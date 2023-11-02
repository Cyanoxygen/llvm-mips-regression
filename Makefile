CC := $(CROSS_COMPILE)gcc
LLC ?= llc
TGT ?= mips64el-unknown-linux-gnuabi64
QEMU_STATIC ?= qemu-mips64el-static
export CC LLC TGT QEMU_STATIC

all:
	$(MAKE) -C src all

%:
	$(MAKE) -C src $@

.PHONY: % all
