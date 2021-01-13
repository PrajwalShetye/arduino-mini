PROJ_DIR = C:/Users/ppshe/Desktop/only-C/arduino-mini
INSTALL_DIR = C:/Users/ppshe/Desktop/only-C/arduino-mini/install

# To use custom programmer edit PROG_DIR variable with path to custom programmer
PROG_DIR = $(PROJ_DIR)/programmer/x86/win32/mingw32/avrdude_6.3

TOOLCHAIN = avr
TOOLCHAIN_PATH = C:/AVR-Toolchains/avr8-gnu-toolchain-win32_x86
TOOLCHAIN_BIN_PATH = $(TOOLCHAIN_PATH)/bin

# programs and commands.
CPPC = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-g++.exe"
CC = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-gcc.exe"
ASM = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-as.exe"
OBJCOPY = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-objcopy.exe"
OBJDUMP = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-objdump.exe"
SIZE = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-size.exe"
AR = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-ar.exe" rcs
NM = "$(TOOLCHAIN_BIN_PATH)/$(TOOLCHAIN)-nm.exe"
AVRDUDE = "$(PROG_DIR)/avrdude.exe"
REMOVE = rm -f
REMOVEDIR = rm -rf
COPY = cp
COPYDIR = cp -rf
MAKEDIR = mkdir -p

# Config file required by avrdude
AVRDUDE_CONFIG = "$(PROG_DIR)/avrdude.conf"

# Programming hardware
# Type: avrdude -c ?
# to get a full listing.
AVRDUDE_PROGRAMMER = arduino

# COM port for arduino. example: com5.
AVRDUDE_PORT = com5    # programmer connected to serial device

# MCU name
MCU = atmega328p

# Processor frequency.
#     This will define a symbol, F_CPU, in all source code files equal to the 
#     processor frequency. You can then use this symbol in your source code to 
#     calculate timings. Do NOT tack on a 'UL' at the end, this will be done
#     automatically to create a 32-bit value in your source code.
#     Typical values are:
#         F_CPU =  1000000
#         F_CPU =  1843200
#         F_CPU =  2000000
#         F_CPU =  3686400
#         F_CPU =  4000000
#         F_CPU =  7372800
#         F_CPU =  8000000
#         F_CPU = 11059200
#         F_CPU = 14745600
#         F_CPU = 16000000
#         F_CPU = 18432000
#         F_CPU = 20000000
F_CPU = 16000000

# Debugging format.
#     Native formats for AVR-GCC's -g are dwarf-2 [default] or stabs.
#     AVR Studio 4.10 requires dwarf-2.
#     AVR [Extended] COFF format requires stabs, plus an avr-objcopy run.
DEBUG = dwarf-2

# Optimization level, can be [0, 1, 2, 3, s]. 
#     0 = turn off optimization. s = optimize for size.
#     (Note: 3 is not always the best optimization level. See avr-libc FAQ.)
OPT = s
