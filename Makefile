SHELL := /bin/bash
CC := gcc
CFLAGS = -Wall -g
LDFLAGS =

SOURCE_DIR = src
HEADER_DIR = src
BUILD_DIR = build
RELEASE_DIR = release

TARGET = $(RELEASE_DIR)/jshell

SOURCES = $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

all:$(TARGET)

$(TARGET):$(OBJECTS)
	$(CC) $(CFLAGS) $(LDFLAGS) -I$(HEADER_DIR) -I$(SOURCE_DIR) $(OBJECTS) -o $@

$(BUILD_DIR)/%.o:$(SOURCE_DIR)/%.c
	$(CC) $(CFLAGS) $(LDFLAGS) -I$(HEADER_DIR) -I$(SOURCE_DIR) -c $< -o $@

clean:
	@rm -rf $(BUILD_DIR)/* $(RELEASE_DIR)/*

test:
	@echo "SOURCES : $(SOURCES)"
	@echo "OBJECTS : $(OBJECTS)"

run:
	./$(TARGET)

.PHONY: all test clean run