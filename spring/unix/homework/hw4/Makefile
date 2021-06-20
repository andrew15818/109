CC = gcc
LIBNAME = capstone
PROGS = main.o args.o cmd.o break.o cap.o

sdb: $(PROGS)
	$(CC) -g  -O3 -l$(LIBNAME) -o $@ $^

%.o: %.C
	$(CC) -c $< -o $@
clean:
	rm -rf *.o sdb

