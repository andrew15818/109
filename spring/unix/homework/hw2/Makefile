CC = gcc
CCX = g++
FLAGS = -g -c 
OBJS = args.o
TARGET = logger.so
LDFLAGS = -shared -fPIC 

all: $(TARGET) sample

sample: sample.c
	$(CC) -o $@ $<

$(TARGET): $(OBJS)
	$(CC) -o $@ $(LDFLAGS) logger.c -ldl

%.o:%.c
	$(CC) $(FLAGS) -o $@ $<
clean:
	rm -f ~* $(OBJS) logger.so logger.o
