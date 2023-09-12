#CC = gcc
CFLAGS = -Wall -Wextra
LIBS = -lcurl

LDFLAGS = -Wl,--hash-style=gnu -Wl,-z,relro,-z,now

SRCS = main.c
EXECUTABLE = hello_curl

.PHONY: all clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^ $(LIBS) -o $@

clean:
	rm -f $(EXECUTABLE)
