#include "cmd.h"
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <elf.h>

#define STR_MAX 256
#define CMD_NUM 16
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
		cmd->type = DELETE;	
	}else if (!strncmp("disasm", buf, 6) || !strncmp("d", buf, 1)){
		printf("** Disasm command\n");
		cmd->type = DISASM;	
	}else if (!strncmp("dump", buf, 4) || !strncmp("x", buf, 1)){
		printf("** Dump command\n");
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
	}else if (!strncmp("set", buf, 3) || !strncmp("s", buf, 1)){
		printf("** Set command\n");
		cmd->type = SET;	
	}else if (!strncmp("si", buf, 2)){
		printf("** Si command\n");
		cmd->type = SI;	
	}else if (!strncmp("start", buf, 5)){
		printf("** Start command\n");
		cmd->type = START;	
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
	strncpy(FILENAME, path, STR_MAX);	
	printf("** Set the executable name to %s\n", FILENAME);
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
		printf("** No process running.\n");
	}	
}
void cmdCont(struct command* cmd, const int* state){

}
void cmdDelete(struct command* cmd, const int * state){}
void cmdDisasm(struct command* cmd, const int * state){}
void cmdDump(struct command* cmd, const int * state){}
void cmdExit(struct command* cmd, const int * state){}
void cmdGet(struct command* cmd, const int * state){}
void cmdGetregs(struct command* cmd, const int * state){}
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
void cmdList(struct command* cmd, const int * state){}
/* Read the ELF header for the entry point.*/
void cmdLoad(struct command* cmd, const int * state){
	FILE* fp = fopen(FILENAME, "rb");
	if(fp == NULL){
		printf("** Could not open file %s\n", FILENAME);
		return;
	}
	Elf64_Ehdr header;	
	fread(&header, 1, sizeof(header), fp);
	printf("** Entry point(?): %lx\n", header.e_entry);
}
void cmdRun(struct command* cmd, const int * state){}
void cmdVmmap(struct command* cmd, const int * state){}
void cmdSet(struct command* cmd, const int * state){}
void cmdSi(struct command* cmd, const int * state){}
void cmdStart(struct command* cmd, const int * state){}

