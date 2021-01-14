include ../project-info.mk

CH_DIR = cd

SKH_DIR = $(PROJ_DIR)/sketch
SKH_NAME =
SKH_NAME_DIR = $(SKH_DIR)/$(SKH_NAME)

.PHONY: help build clean rebuild program program_from_scratch

help:
	@echo "===== ===== Command List ===== ====="
	@echo "help                 ---> help related to commands"
	@echo "build                ---> builds the executable of sketch mentioned using command line arg"
	@echo "clean                ---> cleans all the object files for sketch mentioned using command line arg"
	@echo "rebuild              ---> equivalent to calling 'clean' and then calling 'build'"
	@echo "program              ---> uploads the executable of sketch mentioned using command line arg to hardware"
	@echo "program_from_scratch ---> equivalent to calling 'rebuild' and then calling 'program'"
	@echo " "
	@echo "===== ===== mini-tutorial to use make commands ===== ====="
	@echo " "
	@echo "===== example 1: Use the 'build' command for sketch name 'blinky' ====="
	@echo "make build SKH_NAME=blinky"
	@echo " "
	@echo "===== example 2: Use the 'clean' command for sketch name 'SPIExamples/DigitalPotControl' ====="
	@echo "make clean SKH_NAME=SPIExamples/DigitalPotControl"
	@echo " "
	@echo "===== example 3: Use the 'program_from_scratch' command for sketch name 'WireExamples/digital_potentiometer' ====="
	@echo "make program_from_scratch SKH_NAME=WireExamples/digital_potentiometer"
	@echo " "
	@echo "===== ===== NOTE ===== ====="
	@echo "A valid 'SKH_NAME' is all the sub-directories from sketch directory till makefile of the sketch, as shown in examples"

build:
	($(CH_DIR) $(SKH_NAME_DIR) && make all && $(CH_DIR) $(SKH_DIR))
	@echo "===== ===== Done building $(SKH_NAME) sketch ===== ====="

clean:
	$(CH_DIR) $(SKH_NAME_DIR) && make clean && $(CH_DIR) $(SKH_DIR)
	@echo "===== ===== Done cleaning $(SKH_NAME) sketch ===== ====="

rebuild: clean build
	@echo "===== ===== Done rebuilding $(SKH_NAME) sketch ===== ====="

program:
	$(CH_DIR) $(SKH_NAME_DIR) && make program && $(CH_DIR) $(SKH_DIR)
	@echo "===== ===== Done uploading $(SKH_NAME) sketch ===== ====="

program_from_scratch: rebuild program

