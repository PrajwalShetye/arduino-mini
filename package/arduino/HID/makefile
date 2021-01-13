#----------------------------------------------------------------------------
# On command line:
#
# make all = Make software.
#
# make clean = Clean out built files.
#
# make install = Install the package to install directory mentioned
#
# To rebuild project do "make clean" then "make all".
#----------------------------------------------------------------------------

# name of the package
PKG_NAME = HID

# package dependencies of packge
DEPS = core

include ../../../project-info.mk

PKG_DIR = $(PROJ_DIR)/package/arduino/$(PKG_NAME)
INC_DIR = $(PKG_DIR)/include
SRC_DIR = $(PKG_DIR)/src
OBJ_DIR = $(PKG_DIR)/build/obj
TAR_DIR = $(PKG_DIR)/build/target
DIST_DIR = $(PKG_DIR)/dist

# source files
CPP_SRCS = \
$(SRC_DIR)/HID.cpp\

C_SRCS =

A_SRCS =

DEPS_INC = $(patsubst %,"$(INSTALL_DIR)/%/include",$(DEPS))
INCLUDES = "$(TOOLCHAIN_PATH)/$(TOOLCHAIN)/include" "$(INC_DIR)" $(DEPS_INC)

CPP_STD = -std=gnu++11
C_STD = -std=gnu99

CDEFS = -DF_CPU=$(F_CPU)UL
INCS = $(patsubst %,-I%,$(INCLUDES))
CFLAGS += -mmcu=$(MCU) -Wall -Werror -g$(DEBUG) -O$(OPT)
CFLAGS += $(INCS) $(CDEFS)

ASFLAGS = -mmcu=$(MCU)

TARGET_NAME = lib$(PKG_NAME)
TARGET_EXT = a
TARGET = $(TAR_DIR)/$(TARGET_NAME).$(TARGET_EXT)

OBJS = $(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.o,$(CPP_SRCS))
OBJS += $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(C_SRCS))
OBJS += $(patsubst $(SRC_DIR)%.s,$(OBJ_DIR)%.o,$(A_SRCS))

OBJ_SUBDIRS = $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(CPP_SRCS)))
OBJ_SUBDIRS += $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(C_SRCS)))
OBJ_SUBDIRS += $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(A_SRCS)))

.PHONY: all __mkdir build __target clean install dist

all: __mkdir build dist

__mkdir:
	@echo "===== ===== making directories ===== ====="
	$(MAKEDIR) "$(OBJ_DIR)"
	$(MAKEDIR) "$(TAR_DIR)"
	$(MAKEDIR) $(foreach dir,$(OBJ_SUBDIRS),$(dir))

build: __target

__target: $(OBJS)
	@echo "===== ===== building '$(PKG_NAME)' package as static library ===== ====="
	$(AR) $(TARGET) $^

$(OBJ_DIR)%.o:: $(SRC_DIR)%.cpp
	@echo "===== ===== building '$@' ===== ====="
	$(CPPC) $(CPP_STD) -c $(CFLAGS) $< -o $@

$(OBJ_DIR)%.o:: $(SRC_DIR)%.c
	@echo "===== ===== building '$@' ===== ====="
	$(CC) $(C_STD) -c $(CFLAGS) $< -o $@

$(OBJ_DIR)%.o:: $(SRC_DIR)%.s
	@echo "===== ===== building '$@' ===== ====="
	$(ASM) -c $(ASFLAGS) $< -o $@

dist:
	@echo "===== ===== making distribution ===== ====="
	$(MAKEDIR) "$(DIST_DIR)/lib/"
	$(COPYDIR) $(INC_DIR) $(DIST_DIR)
	$(COPY) "$(TARGET)" "$(DIST_DIR)/lib/"

install: dist
	@echo "===== ===== installing" '$(PKG_NAME)' "package ===== ====="
	$(MAKEDIR) "$(INSTALL_DIR)/$(PKG_NAME)"
	$(COPYDIR) "$(DIST_DIR)/"* "$(INSTALL_DIR)/$(PKG_NAME)"

clean:
	@echo "===== ===== cleaning old files ===== ====="
	$(REMOVEDIR) "$(OBJ_DIR)"
	$(REMOVEDIR) "$(TAR_DIR)"
	$(REMOVEDIR) "$(DIST_DIR)"

