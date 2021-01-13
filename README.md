# arduino-mini
###Using Arduino Code without IDE 

##==== BASIC INFO: ====

###Pre-requisites:
1. AVR Toolchain
	To download "AVR Toolchain for Windows" visit this website
	https://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-c-compilers
2. avrdude (optional)
	http://savannah.nongnu.org/projects/avrdude

You may have to update "TOOLCHAIN_PATH" "PROJ_DIR" "INSTALL_DIR" variables in "project-info.mk"

To build the package, go to repective folder containing "makefile" and use "make clean && make"

To install a previously built package, go to repective folder containing "makefile" and use "make install"

To build a sketch (app), go to repective folder containing "makefile" and use "make clean && make"

To upload a sketch (app), go to repective folder containing "makefile" and use "make program"
**==== NOTE: you must have avrdude installed to burn the code. avrdude 6.3 is currently being used by me ====**

