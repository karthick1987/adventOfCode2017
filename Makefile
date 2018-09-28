#---------------------------------------------------------------------
# executables
#---------------------------------------------------------------------
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'	# No Color
TAB='    '		# 4 spaces
#---------------------------------------------------------------------
# executables
#---------------------------------------------------------------------
MD := mkdir
RM := rm
CC = g++
MKDIR_P = $(MD) -p

#---------------------------------------------------------------------
# flags
#---------------------------------------------------------------------
FLAGS = -Wall -Werror
OFLAGS = -O2
STDFLAGS = -std=c++14

#---------------------------------------------------------------------
# Directories
#---------------------------------------------------------------------
BUILD_DIR=build
OUT_DIR := .
OUT_O_DIR   := $(OUT_DIR)/objs

SRC = $(wildcard *.cpp)
OBJS=$(patsubst %.cpp,$(OUT_O_DIR)/%.o,$(SRC))

$(OUT_O_DIR)/%.o: %.cpp
	@echo -e $(BLUE)$(TAB)Invoking Compiler $(CC)
	@echo -e $(RED)$(TAB)Compiling files $@ $(NC)
	$(MKDIR_P) $(dir $@)
	$(CC) -c $(FLAGS) $(STDFLAGS) $< -o $@

$(BUILD_DIR)/adv1: $(OBJS)
	@echo -e $(BLUE)$(TAB)Building Target "$@" $(NC)
	$(MKDIR_P) $(dir $@)
	$(CC) $(FLAGS) $(OFLAGS) $(STDFLAGS) -o $(BUILD_DIR)/adv1 $(OBJS)
.PHONY: directories clean

clean:
	rm -rf $(BUILD_DIR)/* $(OUT_O_DIR)/*.o

all: directories adv1

# directories: ${OUT_DIR} ${OUT_O_DIR} ${BUILD_DIR}
# 
# ${OUT_DIR}:
# 	${MKDIR_P} -p ${OUT_DIR}
# 
# ${OUT_O_DIR}:
# 	${MKDIR_P} -p ${OUT_O_DIR}
# 
# ${BUILD_DIR}:
# 	${MKDIR_P} -p ${BUILD_DIR}
