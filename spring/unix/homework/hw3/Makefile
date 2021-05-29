CC=gcc
CXX = g++
ASM32 = yasm -f elf32 -DYASM
ASM64 = yasm 
ASMFLAGS = -f elf64 -DYASM -D__x86_64__ -DPIC
CFLAGS=-g -Wall -fno-stack-protector -nostdlib
CFILE = libmini
FILES = libmini.o test.o libmini64.o start.o libmini.so

all: $(FILES)

%.o: %.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

%.o: %.asm
	$(ASM64) $(ASMFLAGS) $< -o $@

libmini.so: libmini64.o libmini.o
	ld -shared -o $@ $^
test.o: test.c
	gcc -c $(CFLAGS) -I. -I.. -DUSEMINI $<

	
test: test.o start.o
	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini

#%.o: %.asm 
#	$(ASM64) $< -o $@
#
#test.o: test.c
#	$(CC) $(CFLAGS) -I. -I.. -DUSEMINI test.c
	
clean:
	rm -rf $(FILES) test
