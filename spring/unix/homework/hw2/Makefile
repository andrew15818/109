CC = gcc
CCX = g++
FLAGS = -g -c 
TARG = hw2
OBJS = hw2.o

hw2: $(OBJS)

%.o: %.c
	$(CC) $(FLAGS) -o $@ $<

clean:
	rm -f ~* $(OBJS) $(TARG)
