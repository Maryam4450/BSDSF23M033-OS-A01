CC = gcc
CFLAGS = -I../include -Wall -g
OBJDIR = ../obj
BINDIR = ../bin
TARGET = $(BINDIR)/client

SRCS = main.c mystrfunctions.c myfilefunctions.c
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(TARGET)

