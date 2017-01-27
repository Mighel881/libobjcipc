ARCHS = armv7 arm64
CFLAGS = -fvisibility=default -fvisibility-inlines-hidden -fno-objc-arc -O2
TARGET = iphone:9.2

#DEBUG=1

LIBRARY_NAME = libobjcipc
libobjcipc_FILES = $(wildcard *.m)
libobjcipc_FRAMEWORKS = CoreFoundation Foundation UIKit
libobjcipc_INSTALL_PATH = /usr/lib/
libobjcipc_LIBRARIES = substrate

include theos/makefiles/common.mk
include $(THEOS_MAKE_PATH)/library.mk

after-install::
	install.exec "killall -9 SpringBoard"
