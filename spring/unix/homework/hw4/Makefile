CC = gcc
PROGS = main.c args.c cmd.c break.c

sdb: $(PROGS)
	$(CC) -g -o $@ $^

clean:
	rm -rf *.o sdb

