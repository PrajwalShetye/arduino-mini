# arduino-mini
###Using Arduino Code without IDE 

##==== BASIC INFO: ====

###Pre-requisites:
1. AVR Toolchain
	To download "AVR Toolchain for Windows" visit this website
	https://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-c-compilers
2. avrdude (optional)
	http://savannah.nongnu.org/projects/avrdude

You have to update "TOOLCHAIN_PATH" "PROJ_DIR" "INSTALL_DIR" variables in "project-info.mk"

To build the package, go to repective package folder containing "makefile" and use "make clean && make"
To install a previously built package, go to repective folder containing "makefile" and use "make install"
####OR
To build and install all the packages at once from scratch do as mentioned :-
	Go to packages/arduino and enter the command ```make from_scratch```


To build a sketch (app), go to repective folder containing "makefile" and use "make clean && make"
To upload a sketch (app), go to repective folder containing "makefile" and use "make program"
####OR
You may also Go to folder named "sketch" and enter the command mentioned :-
	```make SKH_NAME=sketchname program_from_scratch``` 
	**sketchname is the name of sketch. for more info you can use help command in same folder (named sketch)**

**==== NOTE: you must have avrdude installed to burn the code. avrdude 6.3 is currently being used by me ====**

