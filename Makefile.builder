DEBIAN_BUILD_DIRS.vm-stretch := debian-pkg/debian
DEBIAN_BUILD_DIRS.vm-buster := debian-pkg/debian
DEBIAN_BUILD_DIRS.vm-bullseye := debian-pkg/debian
DEBIAN_BUILD_DIRS := $(DEBIAN_BUILD_DIRS.$(PACKAGE_SET)-$(DIST))
RPM_SPEC_FILES := python-qasync.spec

NO_ARCHIVE := 1

ifneq ($(filter $(DISTRIBUTION), debian qubuntu),)
SOURCE_COPY_IN := source-debian-copy-in
endif

source-debian-copy-in: VERSION = $(file <$(ORIG_SRC)/version)
source-debian-copy-in: ORIG_FILE = $(CHROOT_DIR)/$(DIST_SRC)/python-qasync_$(VERSION).orig.tar.gz
source-debian-copy-in: SRC_FILE  = $(ORIG_SRC)/qasync-$(VERSION).tar.gz
source-debian-copy-in:
	cp -p $(SRC_FILE) $(ORIG_FILE)
	tar xzf $(SRC_FILE) -C $(CHROOT_DIR)/$(DIST_SRC)/debian-pkg --strip-components=1



# vim: ft=make
