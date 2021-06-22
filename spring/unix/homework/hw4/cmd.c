
#include <stdlib.h>
#include <sys/ptrace.h>
#include <sys/user.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <elf.h>
#include <assert.h>
#include <fcntl.h>

#include "cmd.h"
#include "break.h"
#include "cap.h"

#define STR_MAX 256
#define CMD_NUM 16
#define PEEKSIZE 8
#define INSNUM 10
#define INSSIZE (INSNUM << 3)

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
FILE* fp = NULL;

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
		execvp(FILENAME, args);
		//execvp("./guess.nopie", args);

		errquit("child");
	}else{	
		cmdSetPid(tmp);
		ptrace(PTRACE_SETOPTIONS, tmp, 0, PTRACE_O_EXITKILL);
		ptrace(PTRACE_ATTACH, tmp, 0, 0);
		return tmp;
	}
	
	return tmp;	
}

// Only check if  the program has terminated after one of these
int isRunCommand(struct command* cmd){
	return (cmd->type == RUN || 
		cmd->type == CONT 	||
		cmd->type == START 	|| 
		cmd->type == SI
		);
}
int cmdSetScript(const char* filename){
	fp = fopen(filename, "r");
	return (fp == NULL);
	errquit("script");
}
// Store the next command in buf
int cmdFromScript( FILE* fp, char* buf){
	if(fgets(buf, STR_MAX, fp) == NULL){
		return 1;
	} 
	printf("** Read: %s\n", buf);
	return 0;
}
/* Get the next command
 * @state:  program state, some commands depend
 * @arg: whether -s given or not
 * */
int cmdNext(struct command* cmd, int* state, struct args* arg){
	enum commandType tp;
	char buf[STR_MAX];
	// TODO: Check if cmd needs to be read from script
	if (arg->s){
		// When we reach script EOF
		if(cmdFromScript(fp, buf)){
			cmdExit(cmd, state);
		}
	}else{
		cmdFromUser(cmd, buf);
	}

	cmdAssignType(cmd, buf);
	
	cmdDispatch(cmd, state);
	// Check if the child proces terminateD
	int status;
	if(isRunCommand(cmd) && waitpid(child, &status, WNOHANG) != 0){
		printf("** Child process is done, returning to main.\n");
		return 1;
	}
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
	char dst[STR_MAX] = {'\0'};
	memset(cmd->path, '\0', sizeof(cmd->path));
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
	}else if (!strncmp("dump", buf, 4) || !strncmp("x", buf, 1)){
		printf("** Dump command\n");
		if(cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			cmd->address = strtol(dst, NULL, 16);
		}else{cmd->address = -1;}
		cmd->type = DUMP;	
	}else if (!strncmp("disasm", buf, 6) || !strncmp("d", buf, 1)){
		printf("** Disasm command\n");
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			printf("Erorr getting address.\n");
			return 1;
		}	
		cmd->address = strtol(dst, NULL, 16);
		printf("Got 0x%08lx\n", cmd->address);
		cmd->type = DISASM;	
	}else if (!strncmp("exit", buf, 4) || !strncmp("q", buf, 1)){
		printf("** Exit command\n");
		cmd->type = EXIT;	
	}else if (!strncmp("getregs", buf, 7)){
		printf("** Getregs command\n");	
		cmd->type = GETREGS;	
	}else if (!strncmp("get", buf, 3) || !strncmp("g", buf, 1)){
		printf("** Get command\n");
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			printf("** Invalid register.\n");
			return 1;
		}
		strncpy(cmd->path, dst, strlen(dst));
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
	}else if (!strncmp("si", buf, 2)){
		printf("** Si command\n");
		cmd->type = SI;	
	}else if (!strncmp("set", buf, 3) || !strncmp("s", buf, 1)){
		printf("** Set command\n");
		cmd->type = SET;	
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 1)){
			fprintf(stderr, "First parameter error.");
			return 1;
		}
		// name of register to change
		strncpy(cmd->path, dst, strlen(dst));
		memset(dst, '\0', sizeof(dst));
		if(!cmdGetParamNo(dst, buf, STR_MAX, strlen(buf), 2)){
			fprintf(stderr, "Second parameter error.");
			return 1;
		}
		cmd->address = strtol(dst, NULL, 16);
		printf("**Going to set %s to : 0x%08lx\n", cmd->path, cmd->address);
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
	fprintf(stderr, "** Set the executable name to %s\n", FILENAME);
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
	
	unsigned int data = ptrace(PTRACE_PEEKDATA, child, (void*)cmd->address, NULL);
	breakAdd(cmd->address, data, cmd->regs);
	fprintf(stderr,"** \tData at 0x%08x: 0x%08x\n", cmd->regs.rip, data);
	// clear the data at that location
	unsigned int datatrap = (data & 0x00)	| 0xcc;
	ptrace(PTRACE_POKEDATA, child, (void*)cmd->address, (void*)datatrap);

	data = ptrace(PTRACE_PEEKDATA, child, (void*)cmd->address, NULL);
	fprintf(stderr,"** \tData with trap: 0x%08x\n", data);

	return;
}

/* Check if process is running and continue? */
/*TODO: Debug this*/
void cmdCont(struct command* cmd, const int* state){
	if(*state != RUNNING){
		fprintf(stderr,"** No program running.\n");	
		return;
	}
	// If the program is stopped continue it?
	int status; 
	//printf("**About to wait\n");

	//if(WIFSTOPPED(status)){
		ptrace(PTRACE_CONT, child, 0, 0);		
		waitpid(child, &status, 0);
		//perror("done");
	//}
	//printf("**done continuing\n");
	//if(waitpid(child, &status, 0) < 0)errquit("waitpid2");
	return;
}
/*Delete the breakpoints*/
void cmdDelete(struct command* cmd, const int * state){
	if(*state != RUNNING){
		fprintf(stderr, "** No program running.\n");
		return;
	}
	printf("** Deleting breakpoint %d\n", cmd->val);
	breakDelete(cmd->val);
}
void cmdDisasm(struct command* cmd, const int * state){
	if(*state!= RUNNING){
		fprintf(stderr,"** No program running.\n");
		return;
	}
	if(capInit() == 1){
		return;
	}
	long int ptr = cmd->address;
	long int tmp, count = 0;
	long int ret;
	long int space = 8* INSNUM; // total amount of bytes to cover = 8 bits/ins * insnum
	// Loop through given address and disassemble
	// Count kinda works better?
	for(ptr; ptr < cmd->address + space && count < 10; ptr += PEEKSIZE){

		if((ret = ptrace(PTRACE_PEEKTEXT, child, ptr, 0)) < 0){/*printf("** You done messed up.\n"*/continue;}
		count += capDisassemble(ptr, ret);
	}
	
}

void cmdDump(struct command* cmd, const int * state){
	if(*state != RUNNING){
		fprintf(stderr,"No program running.\n");	
		return;
	}
	long long int ptr = cmd->address;
	long long int ret;
	int count = 0;
	for(ptr; ptr < cmd->address + INSSIZE && count < 10; ptr++){
		ret = ptrace(PTRACE_PEEKTEXT, child, ptr, 0);
		if(ret < 0)	{continue;}
		capDump(ptr, ret);
	}		
}	

// Exit and terminate the child process.
void cmdExit(struct command* cmd, const int * state){
	if(child != 0){
		int ret = kill(child, SIGTERM);	
		if(ret == -1)errquit("kill@Exit");
	}
	fprintf(stderr,"** Killed process [%d]\n", child);
	exit(0);
}
void cmdGet(struct command* cmd, const int * state){
	if(*state != RUNNING){
		fprintf(stderr,"** No program running.\n");
		return;
	}
	if(ptrace(PTRACE_GETREGS, child, 0, &cmd->regs) < 0) errquit("getregs@get");

	if(!strncmp(cmd->path, "r15", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r15, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r14", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r14, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r13", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r13, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r12", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r12, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r11", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r11, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r10", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r10, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r9", 2)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r9, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "r8", 2)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.r8, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rax", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rax, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rbx", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rbx, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rcx", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rcx, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rdx", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rdx, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rsi", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rsi, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rdi", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rdi, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rbp", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rbp, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rsp", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rsp, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "rip", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.rip, cmd->regs.rip);}	
	else if(!strncmp(cmd->path, "eflags", 3)){printf("%s = 0x%08llx (0x%08llx)\n", cmd->path, cmd->regs.eflags, cmd->regs.rip);}	

	return;
}

void cmdGetregs(struct command* cmd, const int * state){
	if(*state != RUNNING){
		fprintf(stderr, "** No program running.\n");
		return;
	}

	if(ptrace(PTRACE_GETREGS, child, (void*)cmd->address, &cmd->regs) < 0){
		errquit("ptrace@getregs");
	}
	printf("RAX 0x%08llx\t RBX 0x%08llx\t RCX 0x%08llx\t RDX 0x%08llx\n", cmd->regs.rax, cmd->regs.rbx, cmd->regs.rcx, cmd->regs.rdx);
	printf("R8  0x%08llx\t  R9 0x%08llx\t R10 0x%08llx\t R11 0x%08llx\n", cmd->regs.r8, cmd->regs.r9, cmd->regs.r10, cmd->regs.r11);
	printf("R12 0x%08llx\t R13 0x%08llx\t R14 0x%08llx\t R15 0x%08llx\n", cmd->regs.r12, cmd->regs.r13, cmd->regs.r14, cmd->regs.r15);
	printf("RDI 0x%08llx\t RSI 0x%08llx\t RBP 0x%08llx\t RSP 0x%08llx\n", cmd->regs.rdi, cmd->regs.rsi, cmd->regs.rbp, cmd->regs.rsp);
	printf("RIP 0x%08llx\t FLAGS 0x%08llx\n", cmd->regs.rip, cmd->regs.eflags);
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
void getTextLimit(Elf64_Ehdr hdr){
	printf("0x%08x\n", ( hdr.e_entry + hdr.e_shoff + (hdr.e_shentsize * hdr.e_shnum)));
	return;
}
/* Read the ELF header for the entry point.*/
void cmdLoad(struct command* cmd, int * state){
	// We can only load a program if one isn't loaded already right?
	if(*state != ANY){
		fprintf(stderr, "** No program loaded.\n");
		return;
	}
	
	FILE* fp = fopen(FILENAME, "rb");

	if(fp == NULL){
		fprintf(stderr, "** Could not open file %s\n", FILENAME);
		return;
	}	
	
	Elf64_Ehdr header;	
	fread(&header, 1, sizeof(header), fp);
	//TEST
	getTextLimit(header);
	cmdSetState(state, LOADED);
	printf("** 0x%lx\n", FILENAME, header.e_entry);
}

void cmdRun(struct command* cmd, const int * state){
	if(*state == RUNNING){
		fprintf(stderr, "** Program is already running.\n");
	}else if(*state == ANY){
		fprintf(stderr,"** No program is running yet.\n");
		return;
	}
	cmdSetState(state, RUNNING);
	pid_t childPID = initptrace(FILENAME);
	//printf("** pid %d\n", childPID);
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
		fprintf(stderr, "** No program running.\n");
		return;
	}
	int pathsize = 20;
	char path[pathsize];
	snprintf(path, pathsize, "/proc/%d/maps", child);

	char buf[8192];
	int fd, ret; 
	if((fd = open(path, O_RDONLY)) < 0) errquit("open@vmmap");
	//printf("** FD: %d\n", fd);
	while((ret = read(fd, buf, sizeof(buf))) > 0){write(1, buf, ret);}
	close(fd);
	return;
}
void cmdSet(struct command* cmd, const int * state){
	if(*state != RUNNING){
		printf("** No program running.\n");
		return;
	}
	// :'(
	if(ptrace(PTRACE_GETREGS, child, 0, &cmd->regs) < 0)errquit("ptrace@Set");
	if(!strncmp(cmd->path, "r15", 3)){cmd->regs.r15 = cmd->address;}
	else if(!strncmp(cmd->path, "r14", 3)){cmd->regs.r14 = cmd->address;}
	else if(!strncmp(cmd->path, "r13", 3)){cmd->regs.r13 = cmd->address;}
	else if(!strncmp(cmd->path, "r12", 3)){cmd->regs.r12 = cmd->address;}
	else if(!strncmp(cmd->path, "r11", 3)){cmd->regs.r11 = cmd->address;}
	else if(!strncmp(cmd->path, "r10", 3)){cmd->regs.r10 = cmd->address;}
	else if(!strncmp(cmd->path, "r9", 2)){cmd->regs.r9 = cmd->address;}
	else if(!strncmp(cmd->path, "r8", 2)){cmd->regs.r8 = cmd->address;}
	else if(!strncmp(cmd->path, "rax", 3)){cmd->regs.rax = cmd->address;}
	else if(!strncmp(cmd->path, "rbx", 3)){cmd->regs.rbx = cmd->address;}
	else if(!strncmp(cmd->path, "rcx", 3)){cmd->regs.rcx = cmd->address;}
	else if(!strncmp(cmd->path, "rdx", 3)){cmd->regs.rdx = cmd->address;}
	else if(!strncmp(cmd->path, "rsi", 3)){cmd->regs.rsi = cmd->address;}
	else if(!strncmp(cmd->path, "rdi", 3)){cmd->regs.rdi = cmd->address;}
	else if(!strncmp(cmd->path, "rbp", 3)){cmd->regs.rbp = cmd->address;}
	else if(!strncmp(cmd->path, "rsp", 3)){cmd->regs.rsp = cmd->address;}
	else if(!strncmp(cmd->path, "rip", 3)){cmd->regs.rip = cmd->address;}
	else if(!strncmp(cmd->path, "eflags", 3)){cmd->regs.eflags = cmd->address;}

	if(ptrace(PTRACE_SETREGS, child, 0, &cmd->regs) < 0)errquit("setregs@cmdSet");
	//curious
	//struct user_regs_struct regs;
	//if(ptrace(PTRACE_GETREGS, child, 0, &regs) < 0)errquit("setregs@cmdSet");

}
void cmdSi(struct command* cmd, const int * state){
	if(*state != RUNNING ){
		fprintf(stderr, "** No program running.\n");
		return;
	}
	if(ptrace(PTRACE_SINGLESTEP, child, 0, 0) < 0)errquit("ptrace@si");
	int status;
	waitpid(child, &status, 0);
	struct user_regs_struct regs;
	if(ptrace(PTRACE_GETREGS, child, 0, &regs)){errquit("getregs@si");}
	fprintf(stderr,"** Now at 0x%08llx\n", regs.rip);
	return;
}

void cmdStart(struct command* cmd, const int * state){
	if(*state != LOADED){
		fprintf(stderr,"** Program is either not loaded or running.\n");
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

