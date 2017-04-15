export TARGET = iphone:9.3

CFLAGS = -fvisibility=default -fvisibility-inlines-hidden -fno-objc-arc

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libobjcipc
libobjcipc_FILES = $(wildcard *.x) $(wildcard *.m)
libobjcipc_FRAMEWORKS = CoreFoundation Foundation UIKit
libobjcipc_INSTALL_PATH = /usr/lib/
libobjcipc_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/library.mk
