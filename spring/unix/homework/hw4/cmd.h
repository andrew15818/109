#ifndef CMD_H
#define CMD_H
#define  STR_MAX 256
#include <sys/user.h>

#include "args.h"
enum state{
	ANY,
	LOADED,
	RUNNING
};
enum commandType{
	BREAK,
	CONT,
	DELETE,
	DISASM,
	DUMP,
	EXIT,
	GET,
	GETREGS,
	HELP,
	LIST,
	LOAD,
	RUN,
	VMMAP,
	SET,
	SI, 
	START
};

struct command {
	enum commandType type;
	int address; // maybe change int?
	char path[STR_MAX];
	int val;
	struct user_regs_struct regs;
};
// TODO : For clarity name all the funcs cmd{name}

int cmdNext(enum state*, struct args*); // Execute the next command, return 1 on error/finished
void cmdFromUser(struct command*);

#endif
