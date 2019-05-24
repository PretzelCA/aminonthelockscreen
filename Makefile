include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AminOnTheLockscreen
AminOnTheLockscreen_FILES = Tweak.m

BUNDLE_NAME = gq.skyenet.aminonthelockscreen
gq.skyenet.aminonthelockscreen_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
