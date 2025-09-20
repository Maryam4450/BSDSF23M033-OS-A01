# Compiler and flags
CC = gcc
CFLAGS = -Iinclude -Wall

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib

# Files
OBJECTS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o
LIBRARY = $(LIB_DIR)/libmyutils.a
TARGET = $(BIN_DIR)/client_static

# Default target
all: $(TARGET)

# Build the final executable by linking with the static library
$(TARGET): $(OBJ_DIR)/main.o $(LIBRARY)
	$(CC) $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils -o $(TARGET)

# Build the static library
$(LIBRARY): $(OBJECTS)
	ar rcs $(LIBRARY) $(OBJECTS)

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Utility targets
clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET) $(LIBRARY)

.PHONY: all clean

