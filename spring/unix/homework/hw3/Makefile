CC=gcc
CXX = g++
ASM32 = yasm -f elf32 -DYASM
ASM64 = yasm 
ASMFLAGS = -f elf64 -DYASM -D__x86_64__ -DPIC
CFLAGS=-g -Wall -fno-stack-protector -nostdlib
CFILE = libmini
# TODO: Delete some of these files
FILES = libmini.o test.o libmini64.o start.o libmini.so libmini.a  alarm1 alarm2 alarm3 jmp1 jmp2

all: $(FILES)

%.o: %.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

%.o: %.asm
	$(ASM64) $(ASMFLAGS) -g dwarf2 $< -o $@

libmini.so: libmini64.o libmini.o
	ld -shared -o $@ $^

libmini.a: libmini64.o libmini.o
	ar rc libmini.a libmini64.o libmini.o

longjmp: longjmp.o start.o
	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini

#test.o: test.c
#	gcc -c $(CFLAGS) -g -I. -I.. -DUSEMINI $
#
#test: test.o start.o
#	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini
#alarm1: alarm1.o start.o
#	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini
#
#alarm2: alarm2.o start.o
#	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini
#
#alarm3: alarm3.o start.o
#	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini
#
#jmp1: jmp1.o start.o
#	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini
#
jmp2: jmp2.o start.o
	ld -m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -L. -L.. -lmini

#%.o: %.asm 
#	$(ASM64) $< -o $@
#
#test.o: test.c
#	$(CC) $(CFLAGS) -I. -I.. -DUSEMINI test.c
	
clean:
	rm -rf $(FILES) *.o 
