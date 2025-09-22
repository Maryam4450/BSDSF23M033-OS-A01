# Compiler and flags
CC = gcc
CFLAGS = -Iinclude -fPIC
LDFLAGS = -Llib -lmyutils

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib

# Install target
PREFIX ?= /usr/local

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

install: all
	@echo "Installing client and man pages to $(PREFIX)..."
	install -d $(PREFIX)/bin
	install -d $(PREFIX)/share/man/man1
	install -m 0755 $(BIN_DIR)/client $(PREFIX)/bin/client
	install -m 0644 man/man3/*.1 $(PREFIX)/share/man/man1/
	@echo "Installation complete. Run 'client' and 'man mystrlen' to test."

# Clean
clean:
	rm -f $(OBJ_DIR)/*.o $(LIB_DIR)/*.so $(BIN_DIR)/
	*

.PHONY: all clean install


