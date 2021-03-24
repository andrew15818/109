FILES = hw1
CC = gcc
GXX = g++
TARG = hw1
OBJS = hw1.o opts.o
hw1: $(OBJS)

%.o: %.c
	$(CC) -c -o $@ $^ 
	

clean:
	rm -f $(OBJS) hw1
