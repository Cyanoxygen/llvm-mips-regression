CROSS_COMPILE := mipsisa64r6el-aosc-linux-gnuabi64-
CC := $(CROSS_COMPILE)gcc
LLC ?= llc
TGT ?= mipsisa64r6el-aosc-linux-gnuabi64
QEMU_STATIC ?= qemu-mips64el-static
export CC LLC TGT QEMU_STATIC

all:
	$(MAKE) -C src all

%:
	$(MAKE) -C src $@

.PHONY: % all
