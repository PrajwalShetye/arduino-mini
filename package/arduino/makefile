include ../../project-info.mk

CH_DIR = cd

# PKG_LIST must contain independent package first and dependent packages later.
PKG_LIST := core HID Servo SoftwareSerial SPI Wire

PKG_DIR = $(PROJ_DIR)/package
PKG_SUB_DIR := arduino

.PHONY: build_and_install_all clean_all rebuild_and_install_all from_scratch

build_and_install_all:
	@echo "===== ===== building & installing all packges ===== ====="
	$(foreach pkg, $(PKG_LIST), $(CH_DIR) "$(PKG_DIR)/$(PKG_SUB_DIR)/$(pkg)" && make all && make install && cd ../ &&) echo "===== ===== Building & Installing Complete. ===== ====="

clean_all:
	@echo "===== ===== cleaning all packges ===== ====="
	$(foreach pkg, $(PKG_LIST), $(CH_DIR) "$(PKG_DIR)/$(PKG_SUB_DIR)/$(pkg)" && make clean && cd ../ &&) echo "===== ===== Cleaning Complete. ===== ====="

rebuild_and_install_all: clean_all build_and_install_all

from_scratch: rebuild_and_install_all
