#----------------------------------------------------------------------------
# On command line:
#
# make all = Make software.
#
# make clean = Clean out built files.
#
# make program = Download the hex file to the device, using avrdude.
#                DONOT FORGET to customize the avrdude settings below first!
#
# To rebuild project do "make clean" then "make all".
#----------------------------------------------------------------------------

# name of the sketch/app
SKETCH_NAME = blinky

# package dependencies of sketch/app
DEPS = core

include ../../project-info.mk

SKETCH_DIR = $(PROJ_DIR)/sketch/$(SKETCH_NAME)
INC_DIR = $(SKETCH_DIR)/include
SRC_DIR = $(SKETCH_DIR)/src
OBJ_DIR = $(SKETCH_DIR)/build/obj
TAR_DIR = $(SKETCH_DIR)/build/target

# source files
CPP_SRCS = $(SRC_DIR)/blinky.cpp

C_SRCS =

A_SRCS =

DEPS_INC = $(patsubst %,"$(INSTALL_DIR)/%/include",$(DEPS))
INCLUDES = "$(TOOLCHAIN_PATH)/$(TOOLCHAIN)/include" $(INC_DIR) $(DEPS_INC)

CPP_STD = -std=gnu++11
C_STD = -std=gnu99

CDEFS = -DF_CPU=$(F_CPU)UL -DARDUINO_ARCH_AVR
INCS = $(patsubst %,-I%,$(INCLUDES))
CFLAGS += -mmcu=$(MCU) -Wall -Werror -g$(DEBUG) -O$(OPT)
CFLAGS += $(INCS) $(CDEFS)

ASFLAGS = -mmcu=$(MCU)

TARGET_NAME = $(SKETCH_NAME)
TARGET_EXT = elf
TARGET = $(TAR_DIR)/$(TARGET_NAME).$(TARGET_EXT)

OBJS += $(patsubst $(SRC_DIR)%.cpp,$(OBJ_DIR)%.o,$(CPP_SRCS))
OBJS += $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(C_SRCS))
OBJS += $(patsubst $(SRC_DIR)%.s,$(OBJ_DIR)%.o,$(A_SRCS))

OBJ_SUBDIRS += $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(CPP_SRCS)))
OBJ_SUBDIRS += $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(C_SRCS)))
OBJ_SUBDIRS += $(patsubst $(SRC_DIR)/%,$(OBJ_DIR)/%,$(dir $(A_SRCS)))

LDFLAGS = $(patsubst %,-L"$(INSTALL_DIR)/%/lib",$(DEPS))
LIBS = $(patsubst %,-l%,$(DEPS)) -lm

# Display size of file.
HEXSIZE = $(SIZE) --target=$(FORMAT) "$(TAR_DIR)/$(TARGET_NAME).hex"
ELFSIZE = $(SIZE) --mcu=$(MCU) --format=avr "$(TAR_DIR)/$(TARGET_NAME).elf"

.PHONY: all __mkdir build clean

all: __mkdir build

__mkdir:
	@echo "===== ===== making directories ===== ====="
	$(MAKEDIR) $(OBJ_DIR)
	$(MAKEDIR) $(TAR_DIR)
	$(MAKEDIR) $(foreach dir,$(OBJ_SUBDIRS),$(dir))

build: $(TARGET)

$(TARGET): $(OBJS)
	@echo "===== ===== linking "$(SKETCH_NAME)" ===== ====="
	$(CC) $(CFLAGS) $(LDFLAGS) $^ -o $@ $(LIBS)
	@echo 
	$(ELFSIZE)

$(OBJ_DIR)%.o:: $(SRC_DIR)%.cpp
	@echo "===== ===== building "$@" ===== ====="
	$(CC) $(CPP_STD) -c $(CFLAGS) $< -o $@

$(OBJ_DIR)%.o:: $(SRC_DIR)%.c
	@echo "===== ===== building "$@" ===== ====="
	$(CC) $(C_STD) -c $(CFLAGS) $< -o $@

$(OBJ_DIR)%.o : $(SRC_DIR)%.s
	@echo "===== ===== building "$@" ===== ====="
	$(ASM) -c $(ASFLAGS) $< -o $@

clean:
	@echo "===== ===== cleaning old files ===== ====="
	$(REMOVEDIR) $(OBJ_DIR)
	$(REMOVEDIR) $(TAR_DIR)


#---------------- Programming Options (avrdude) ----------------

# Output format. (can be srec, ihex, binary)
FORMAT = ihex

AVRDUDE_WRITE_FLASH = -U flash:w:"$(TAR_DIR)/$(TARGET_NAME).hex":i
#AVRDUDE_WRITE_EEPROM = -U eeprom:w:$(TARGET).eep

# Uncomment the following if you want avrdude's erase cycle counter.
# Note that this counter needs to be initialized first using -Yn,
# see avrdude manual.
#AVRDUDE_ERASE_COUNTER = -y

# Uncomment the following if you do /not/ wish a verification to be
# performed after programming the device.
#AVRDUDE_NO_VERIFY = -V

# Increase verbosity level.  Please use this when submitting bug
# reports about avrdude. See <http://savannah.nongnu.org/projects/avrdude> 
# to submit bug reports.
#AVRDUDE_VERBOSE = -v -v

AVRDUDE_FLAGS = -p $(MCU) -P $(AVRDUDE_PORT) -c $(AVRDUDE_PROGRAMMER) -C $(AVRDUDE_CONFIG)
AVRDUDE_FLAGS += $(AVRDUDE_NO_VERIFY)
AVRDUDE_FLAGS += $(AVRDUDE_VERBOSE)
AVRDUDE_FLAGS += $(AVRDUDE_ERASE_COUNTER)

program: $(TAR_DIR)/$(TARGET_NAME).eep $(TAR_DIR)/$(TARGET_NAME).hex
	$(AVRDUDE) $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH) $(AVRDUDE_WRITE_EEPROM)

# Create final output files (.hex, .eep) from ELF output file.
$(TAR_DIR)%.hex: $(TAR_DIR)%.elf
	@echo "===== ===== creating .hex file ===== ====="
	@echo $(MSG_FLASH) $@
	$(OBJCOPY) -O $(FORMAT) -R .eeprom -R .fuse -R .lock $< $@
	$(HEXSIZE)

$(TAR_DIR)%.eep: $(TAR_DIR)%.elf
	@echo "===== ===== creating .epp file ===== ====="
	@echo $(MSG_EEPROM) $@
	-$(OBJCOPY) -j .eeprom --set-section-flags=.eeprom="alloc,load" \
	--change-section-lma .eeprom=0 --no-change-warnings -O $(FORMAT) $< $@ || exit 0

