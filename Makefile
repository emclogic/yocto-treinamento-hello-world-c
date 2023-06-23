#CC = gcc
CFLAGS = -Wall -Wextra
LIBS = -lcurl

SRCS = main.c
EXECUTABLE = hello_curl

.PHONY: all clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(SRCS)
	$(CC) $(CFLAGS) $^ $(LIBS) -o $@

clean:
	rm -f $(EXECUTABLE)
