CC = gcc
CFLAGS = -Wall -Wextra
LIBS = -lcurl

SRCS = hello_curl.c
OBJS = $(SRCS:.c=.o)
EXECUTABLE = hello_curl

.PHONY: all clean

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(EXECUTABLE)

