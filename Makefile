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

#---------------------------------------------------------------------
# Put objects in the output directory.
#---------------------------------------------------------------------
OUT_DIR := .
OUT_O_DIR   := $(OUT_DIR)/objs

SRC = $(wildcard *.cpp)
OBJS=$(subst %.cpp,$(OUT_O_DIR)/%.o,$(SRC))

$(OUT_O_DIR)/%.o: %.cpp
	$(CC) -c $(FLAGS) $(STDFLAGS) $< -o $@

$(BUILD_DIR)/adv1: $(OBJS)
	$(CC) $(FLAGS) $(OFLAGS) $(STDFLAGS) -o $(BUILD_DIR)/adv1 $(OBJS)

.PHONY: directories clean

clean:
	rm -rf $(BUILD_DIR) $(OUT_O_DIR)/*.o

all: directories adv1

directories: ${OUT_DIR} ${OUT_O_DIR} ${BUILD_DIR}

${OUT_DIR}:
	${MKDIR_P} -p ${OUT_DIR}
${OUT_O_DIR}:
	${MKDIR_P} -p ${OUT_O_DIR}
${BUILD_DIR}:
	${MKDIR_P} -p ${BUILD_DIR}
