export TARGET = iphone:9.3

CFLAGS = -fvisibility=default -fvisibility-inlines-hidden -fobjc-arc

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libobjcipc
libobjcipc_FILES = $(wildcard *.x) $(wildcard *.m)
libobjcipc_FRAMEWORKS = CoreFoundation Foundation UIKit
libobjcipc_EXTRA_FRAMEWORKS = CydiaSubstrate
libobjcipc_INSTALL_PATH = /usr/lib/

SUBPROJECTS = objcipcassertiondhooks objcipcbackboarddhooks

include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-libobjcipc-stage::
	@# create directory
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries$(ECHO_END)

	@# Create Link
	$(ECHO_NOTHING)ln -s /usr/lib/libobjcipc.dylib $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/libobjcipc.dylib$(ECHO_END)

	@# move Filter Plist
	$(ECHO_NOTHING)cp libobjcipc.plist $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries$(ECHO_END)
