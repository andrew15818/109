#ifndef CMD_H
#define CMD_H
#define  STR_MAX 256
#include <sys/user.h>

#include "args.h"
#include "break.h"
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
	long int address; // maybe change int?
	char path[STR_MAX];
	int val;
	struct user_regs_struct regs;
};


// Pair command type with responsible function
typedef struct funcPair{
		int type;
		void (*exec)(struct command*, const int* state);
}funcPair;

/* Need to be extern so we can use them over all our program. */
extern funcPair funcPairs[];
extern char FILENAME[STR_MAX];

// TODO : For clarity name all the funcs cmd{name}
int cmdNext(struct command*, int* , struct args*); // Execute the next command, return 1 on error/finished
void cmdFromUser(struct command*, char* buf);
int cmdAssignType(struct command*, char* buf);
int cmdGetParamNo(char* buf, char* src, int bufsize, int srcsize, int paramNo);
int cmdSetExecFilename(const char*);
void cmdDispatch(struct command*, int*);

/* Command functions*/
void cmdBreak (struct command*, 	const int*);
void cmdCont(struct command*, 		const int*);
void cmdDelete(struct command*, 	const int*);
void cmdDisasm(struct command*, 	const int*);
void cmdDump(struct command*, 		const int*);
void cmdExit(struct command*, 		const int*);
void cmdGet(struct command*, 		const int*);
void cmdGetregs(struct command*, 	const int*);
void cmdHelp(struct command*, 		const int*);
void cmdList(struct command*, 		const int*);
void cmdLoad(struct command*, 		const int*);
void cmdRun(struct command*, 		const int*);
void cmdVmmap(struct command*, 		const int*);
void cmdSet(struct command*, 		const int*);
void cmdSi(struct command*, 		const int*);
void cmdStart(struct command*, 		const int*);

#endif
