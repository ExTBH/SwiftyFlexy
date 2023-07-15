ARCHS = arm64

TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwiftyFlexy

SwiftyFlexy_FILES = $(shell find Sources/SwiftyFlexy -name '*.swift') $(shell find Sources/SwiftyFlexyC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
SwiftyFlexy_SWIFTFLAGS = -ISources/SwiftyFlexyC/include
SwiftyFlexy_CFLAGS = -fobjc-arc -ISources/SwiftyFlexyC/include

SwiftyFlexy_EXTRA_FRAMEWORKS = SwiftHooker

include $(THEOS_MAKE_PATH)/tweak.mk
