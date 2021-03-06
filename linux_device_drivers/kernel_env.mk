ARCH ?= arm
CROSS_COMPILE ?= arm-linux-gnueabi-
# Assume the source tree is where the running kernel was built
# You should set KERNELDIR in the environment if it's elsewhere
KERNELDIR ?= ../../qemu_linux/build/${ARCH}/linux
INSTALLDIR ?= ../../../rootfs
PROGINSTALLDIR ?= ../../qemu_linux/rootfs

export ARCH CROSS_COMPILE

.PHONY: all clean install
all: $(CROSS_PROGS) $(HOST_PROGS) $(ASSEMBLE)
	$(MAKE) -C $(KERNELDIR) M=$(CURDIR) modules

$(CROSS_PROGS): CC=$(CROSS_COMPILE)gcc

clean:
	@rm -f $(CROSS_PROGS) $(HOST_PROGS) $(ASSEMBLE) *.o
	$(MAKE) -C $(KERNELDIR) M=$$PWD clean

install:
	INSTALL_MOD_PATH=$(INSTALLDIR) $(MAKE) -C $(KERNELDIR) M=$(CURDIR) modules_install
	@[ -z "$(CROSS_PROGS)" ] || cp $(CROSS_PROGS) -f $(PROGINSTALLDIR)/usr/bin/
	@[ -z "$(SCRIPT_FILES)" ] || cp $(SCRIPT_FILES) -f $(PROGINSTALLDIR)/usr/bin/
	@[ -z "$(SCRIPT_FILES)" ] || ( cd $(PROGINSTALLDIR)/usr/bin/; chmod +x $(SCRIPT_FILES) )
