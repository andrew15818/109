
#include <stdlib.h>
#include <sys/ptrace.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <elf.h>
#include <assert.h>
#include <fcntl.h>

#include "cmd.h"
#include "break.h"
#define STR_MAX 256
#define CMD_NUM 16
/* Extern variable declarations */
funcPair funcPairs[CMD_NUM] = {
	{.type=BREAK, 		.exec=cmdBreak},
	{.type=CONT, 		.exec=cmdCont},
	{.type=DELETE, 		.exec=cmdDelete},
	{.type=DISASM, 		.exec=cmdDisasm},
	{.type=DUMP, 		.exec=cmdDump},
	{.type=EXIT, 		.exec=cmdExit},
	{.type=GET, 		.exec=cmdGet},
	{.type=GETREGS, 	.exec=cmdGetregs},
	{.type=HELP, 		.exec=cmdHelp},
	{.type=LIST, 		.exec=cmdList},
	{.type=LOAD, 		.exec=cmdLoad},
	{.type=RUN, 		.exec=cmdRun},
	{.type=VMMAP, 		.exec=cmdVmmap},
	{.type=SET, 		.exec=cmdSet},
	{.type=SI, 			.exec=cmdSi},
	{.type=START, 		.exec=cmdStart},
};

char FILENAME[STR_MAX];
pid_t child;
int cmdSetPid(const pid_t newPid){
	child = newPid;	
	printf("** PID: %d\n", child);
	return 0;
}
void errquit(const char* msg){
	perror(msg);
	exit(-1);
}

int cmdSetState(int* state, const int changeTo){
	*state = changeTo;
	printf("** State: ");
	switch(*state){
		case ANY:
			printf("ANY\n");
			break;
		case LOADED:
			printf("LOADED\n");
			break;
		case RUNNING:
			printf("RUNNING\n");
			break;
	}
	return 0;
}
/*Create the child process and exec the process*/
pid_t initptrace(const char* prog){
	pid_t tmp;
	if((tmp = fork()) < 0){
		printf("** Error forking.\n");
		return 1;
	}
	// Child code
	if( tmp == 0){
		if(ptrace(PTRACE_TRACEME, 0, 0, 0) < 0){errquit("traceme");}
	
		// TODO: The &args looks weird...
		char* args[] = {"", NULL};
		printf("** Tracing %s\n", prog);
		//execvp("./hello64", args);
		execvp("./guess.nopie", args);

		errquit("child");
	}else{	
		cmdSetPid(tmp);
		ptrace(PTRACE_SETOPTIONS, tmp, 0, PTRACE_O_EXITKILL);
		return tmp;
	}
	
	return tmp;	
}



/* Get the next command
 * @state:  program state, some commands depend
 * @arg: whether -s given or not
 * */
int cmdNext(struct command* cmd, int* state, struct args* arg){
	enum commandType tp;
	char buf[STR_MAX];
	// TODO: Check if cmd needs to be read from script
	/*if (arg->s){
	 * }*/
	cmdFromUser(cmd, buf);
	cmdAssignType(cmd, buf);
	if(cmd->type == EXIT){
		return 1;	
	}
	cmdDispatch(cmd, state);
	return 0;
}
void cmdFromUser(struct command* cmd, char* buf){
	char dst[STR_MAX];
	printf("sdb> ");
	fgets(buf, STR_MAX, stdin);
	return;
}

// print Help message

// Get the params and just call the appropriate function?
// TODO: Some abbrevs call the wrong thing.
int cmdAssignType(struct command* cmd, char* buf){
	char dst[STR_MAX];
	if(!strncmp("br", buf, 2) || !strncmp("b", buf, 1)){
		printf("** Break command\n");
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			printf("** \tInvalid argument.\n");
			return 1;
		}
		cmd->address = strtol(dst, NULL, 16);
		printf("** \tBreakpoint at %lx\n", cmd->address);
		cmd->type = BREAK;	
	}else if (!strncmp("cont", buf, 4) || !strncmp("c", buf, 1)){
		printf("** Cont command\n");
		cmd->type = CONT;	
	}else if (!strncmp("delete", buf, 6)){
		printf("** Delete command\n");
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			printf("** \tInvalid argument.\n");
			return 1;
		}
		cmd->val = atoi(dst);
		cmd->type = DELETE;	
		return 0;
	}else if (!strncmp("disasm", buf, 6) || !strncmp("d", buf, 1)){
		printf("** Disasm command\n");
		cmd->type = DISASM;	
	}else if (!strncmp("dump", buf, 4) || !strncmp("x", buf, 1)){
		printf("** Dump command\n");
		if(cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			cmd->address = strtol(dst, NULL, 16);
		}else{cmd->address = -1;}
		cmd->type = DUMP;	
	}else if (!strncmp("exit", buf, 4) || !strncmp("q", buf, 1)){
		printf("** Exit command\n");
		cmd->type = EXIT;	
	}else if (!strncmp("getregs", buf, 7)){
		printf("** Getregs command\n");	
		cmd->type = GETREGS;	
	}else if (!strncmp("get", buf, 3) || !strncmp("g", buf, 1)){
		printf("** Get command\n");
		cmd->type = GET;	
	}else if (!strncmp("help", buf, 4) || !strncmp("h", buf, 1)){
		printf("** Help command\n");
		cmd->type = HELP;	
	}else if (!strncmp("load", buf, 4)){
		printf("** Load command\n");
		if(cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			strncpy(cmd->path, dst, strlen(cmd->path));
			cmdSetExecFilename(dst);
		}
		cmd->type = LOAD;	
	}else if (!strncmp("list", buf, 4) || !strncmp("l", buf, 1)){
		printf("** List command\n");
		cmd->type = LIST;	
	}else if (!strncmp("run", buf, 3) || !strncmp("r", buf, 1)){
		printf("** Run command\n");
		cmd->type = RUN;	
	}else if (!strncmp("vmmap", buf, 5) || !strncmp("m", buf, 1)){
		printf("** Vmmap command\n");
		cmd->type = VMMAP;	
	}else if (!strncmp("start", buf, 5)){
		printf("** Start command\n");
		cmd->type = START;	
	}else if (!strncmp("set", buf, 3) || !strncmp("s", buf, 1)){
		printf("** Set command\n");
		cmd->type = SET;	
	}else if (!strncmp("si", buf, 2)){
		printf("** Si command\n");
		cmd->type = SI;	
	}	
	return cmd->type;
}
// Get the ith parameter of cmd string
int cmdGetParamNo(char* buf, char* src, int bufsize, int srcsize,  int paramNo){
	int spacecount = 0, j = 0;
	int i =0;
	// skip whitespace at beginning
	while(src[i] == ' '){
		i++;	
	}
	while(i < srcsize){
		if(spacecount == paramNo){
			int index = i;	
			while(src[index] != ' ' && src[index] != '\n'){
				buf[j]  = src[index];
				j++;
				index++;	
			}
			printf("** Got %s\n", buf);
			return 1;
		}
		if(src[i] == ' '){
			spacecount++;	
		}
		i++;
	}
	//buf = NULL;
	return 0;
}
int cmdSetExecFilename(const char* path){
	if(path == NULL || strlen(path) == 0){
		return 1;
	}
	strncpy(FILENAME, path, STR_MAX);	
	printf("** Set the executable name to %s\n", FILENAME);
	return 0;
}
// Call the appropriate function
void cmdDispatch(struct command* cmd, int* state){
	void (*ptr)(struct command*, const int*) = NULL;
	funcPair sent;	
	for(int i = 0; i < CMD_NUM; i++){
		sent = funcPairs[i];
		if(cmd->type == sent.type){
			ptr = sent.exec;
			break;
		}					
	}
	if(ptr == NULL){return;}
	ptr(cmd, state);
}

/*** Command Exec functions***/
void cmdBreak(struct command* cmd, const int * state){
	if(*state != RUNNING){
	}
	// add breakpoint to the list

	/*TODO: Set the breakpoint with ptrace*/

	/* 1. Use PEEKDATA to get the current data at cmd->address
		2. Save the register content?
		2. Replace the first byte of that with 0xcc
		3. Put the word back with POKEDATA
	*/
	int status;
	ptrace(PTRACE_GETREGS, child, 0, &cmd->regs);	
	// save the old regs
	breakAdd(cmd->address, cmd->regs);
	unsigned int data = ptrace(PTRACE_PEEKDATA, child, (void*)cmd->address, NULL);
	printf("** \tData at 0x%08x: 0x%08x\n", cmd->regs.rip, data);
	// clear the data at that location
	unsigned int datatrap = (data & 0x00)	| 0xcc;
	ptrace(PTRACE_POKEDATA, child, (void*)cmd->address, (void*)datatrap);

	data = ptrace(PTRACE_PEEKDATA, child, (void*)cmd->address, NULL);
	printf("** \tData with trap: 0x%08x\n", data);

	return;
}

/* Check if process is running and continue? */
/*TODO: Debug this*/
void cmdCont(struct command* cmd, const int* state){
	if(*state != RUNNING){
		printf("** No program running.\n");	
		return;
	}
	// If the program is stopped continue it?
	int status; 
	printf("**About to wait\n");

	if(WIFSTOPPED(status)){
		ptrace(PTRACE_CONT, child, 0, 0);		
		waitpid(child, &status, 0);
	//	perror("done");
	}
	printf("**done continuing\n");
	if(waitpid(child, &status, 0) < 0)errquit("waitpid2");
	return;
}
/*Delete the breakpoints*/
void cmdDelete(struct command* cmd, const int * state){
	if(*state != RUNNING){
		printf("** No program running.\n");
		return;
	}
	printf("** Deleting breakpoint %d\n", cmd->val);
	breakDelete(cmd->val);
}
void cmdDisasm(struct command* cmd, const int * state){}

void cmdDump(struct command* cmd, const int * state){
	if(*state != RUNNING){
		printf("No program running.\n");	
		return;
	}
	
}
void cmdExit(struct command* cmd, const int * state){}
void cmdGet(struct command* cmd, const int * state){}

void cmdGetregs(struct command* cmd, const int * state){
	if(*state != RUNNING){
		printf("** No program running.\n");
		return;
	}

	if(ptrace(PTRACE_GETREGS, child, (void*)cmd->address, &cmd->regs) < 0){
		errquit("ptrace@getregs");
	}
	printf("RAX 0x%08x\t RBX 0x%08x\t RCX 0x%08x\t RDX 0x%08x\n", cmd->regs.rax, cmd->regs.rbx, cmd->regs.rcx, cmd->regs.rdx);
	printf("R8  0x%08x\t  R9 0x%08x\t R10 0x%08x\t R11 0x%08x\n", cmd->regs.r8, cmd->regs.r9, cmd->regs.r10, cmd->regs.r11);
	printf("R12 0x%08x\t R13 0x%08x\t R14 0x%08x\t R15 0x%08x\n", cmd->regs.r12, cmd->regs.r13, cmd->regs.r14, cmd->regs.r15);
	printf("RDI 0x%08x\t RSI 0x%08x\t RBP 0x%08x\t RSP 0x%08x\n", cmd->regs.rdi, cmd->regs.rsi, cmd->regs.rbp, cmd->regs.rsp);
	printf("RIP 0x%08x\t FLAGS 0x%08x\n", cmd->regs.rip, cmd->regs.eflags);
	return;
}
void cmdHelp( struct command* cmd, const int* state){
	const char* help = 
		"- break {instruction-address}: add a break point\n"
		"- cont: continue execution\n"
		"- delete {break-point-id}: remove a break point\n"
		"- disasm addr: disassemble instructions in a file or a memory region\n"
		"- dump addr [length]: dump memory content\n"
		"- exit: terminate the debugger\n"
		"- get reg: get a single value from a register\n"
		"- getregs: show registers\n"
		"- help: show this message\n"
		"- list: list break points\n"
		"- load {path/to/a/program}: load a program\n"
		"- run: run the program\n"
		"- vmmap: show memory layout\n"
		"- set reg val: get a single value to a register\n"
		"- si: step into instruction\n"
		"- start: start the program and stop at the first instruction\n";	
	printf("%s", help);
}
// List the breakpoints.
void cmdList(struct command* cmd, const int * state){
	breakPrint();	
}
/* Read the ELF header for the entry point.*/
void cmdLoad(struct command* cmd, int * state){
	// We can only load a program if one isn't loaded already right?
	if(*state != ANY){
		printf("** No program loaded.\n");
		return;
	}
	
	FILE* fp = fopen(FILENAME, "rb");

	if(fp == NULL){
		printf("** Could not open file %s\n", FILENAME);
		return;
	}	

	Elf64_Ehdr header;	
	fread(&header, 1, sizeof(header), fp);
	cmdSetState(state, LOADED);
	printf("** Program '%s' loaded. entry point 0x%lx\n", FILENAME, header.e_entry);
}
void cmdRun(struct command* cmd, const int * state){
	if(*state == RUNNING){
		printf("** Program is already running.\n");
	}else if(*state == ANY){
		printf("** No program is running yet.\n");
		return;
	}
	cmdSetState(state, RUNNING);
	pid_t childPID = initptrace(FILENAME);
	printf("** pid %d\n", childPID);
	int status; 
	if(waitpid(childPID, &status, 0) < 0)errquit("waitpid");
	if(WIFSTOPPED(status)){
		ptrace(PTRACE_CONT, childPID, 0, 0);		
		waitpid(childPID, &status, 0);
		perror("done");
	}
	return;
}
void cmdVmmap(struct command* cmd, const int * state){
	if(*state != RUNNING){
		printf("** No program running.\n");
		return;
	}
	int pathsize = 20;
	char path[pathsize];
	snprintf(path, pathsize, "/proc/%d/maps", child);
	printf("** Searching the depths of %s\n", path);

	char buf[8192];
	int fd, ret; 
	if((fd = open(path, O_RDONLY)) < 0) errquit("open@vmmap");
	printf("** FD: %d\n", fd);
	while((ret = read(fd, buf, sizeof(buf))) > 0){write(1, buf, ret);}
	close(fd);
	return;
}
void cmdSet(struct command* cmd, const int * state){}
void cmdSi(struct command* cmd, const int * state){}

void cmdStart(struct command* cmd, const int * state){
	if(*state != LOADED){
		printf("** Program is either not loaded or running.\n");
		return;
	}
	cmdSetState(state, RUNNING);
	pid_t childPID = initptrace(FILENAME);
	int status;
	if(waitpid(childPID, &status, 0)< 0)errquit("waitpid");
	if(WIFSTOPPED(status)){
		int res = ptrace(PTRACE_SINGLESTEP, childPID, 0, 0);
		if(waitpid(childPID, &status, 0)< 0)errquit("waitpid2");
	}
	return;
}

