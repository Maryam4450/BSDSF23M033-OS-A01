# Compiler and flags
CC = gcc
CFLAGS = -Iinclude -fPIC
LDFLAGS = -Llib -lmyutils

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib

# Files
OBJECTS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o
MAIN = $(OBJ_DIR)/main.o
LIBRARY = $(LIB_DIR)/libmyutils.so
TARGET = $(BIN_DIR)/client_dynamic

# Ensure directories exist
$(shell mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR))

# Default target
all: $(TARGET)

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Build shared library
$(LIBRARY): $(OBJECTS)
	$(CC) -shared -o $@ $(OBJECTS)

# Link main with shared library
$(TARGET): $(MAIN) $(LIBRARY)
	$(CC) $(MAIN) -L$(LIB_DIR) -lmyutils -o $(TARGET)

# Clean
clean:
	rm -f $(OBJ_DIR)/*.o $(LIB_DIR)/*.so $(BIN_DIR)/*

.PHONY: all clean

