# Variables
CC = gcc
CFLAGS = -march=znver3 -O3 -Wall -Wextra
KB_LAYOUT_SRC = layout.c
KB_LAYOUT_BIN = kb_layout

# Default target
all: $(KB_LAYOUT_BIN)

# Compile keyboard layout program
$(KB_LAYOUT_BIN): $(KB_LAYOUT_SRC)
	$(CC) $(CFLAGS) -o $(KB_LAYOUT_BIN) $(KB_LAYOUT_SRC)

# Install
install: $(KB_LAYOUT_BIN)
	echo "Installing kb_layout ..."
	cp -f $(KB_LAYOUT_BIN) /usr/local/bin
	chmod 755 /usr/local/bin/$(KB_LAYOUT_BIN)

clean:
	echo "Cleaning up ..."
	rm -f $(KB_LAYOUT_BIN)

uninstall:
	echo "Uninstalling ..."
	rm -f $(KB_LAYOUT_BIN)
	rm -f /usr/local/bin/$(KB_LAYOUT_BIN)

.PHONY: all install clean
