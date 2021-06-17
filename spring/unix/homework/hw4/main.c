#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ptrace.h>
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include <elf.h>

#include "args.h"
#include "cmd.h"
pid_t child, parent;
void logDebug(const char* msg){
	printf("** %s\n", msg);
}

int initptrace(char* prog, char** args){
	if((child = fork()) < 0){
		printf("** Error attaching tracer.\n");
		return 1;
	}
	// Child code
	if( child == 0){
		if(ptrace(PTRACE_TRACEME, 0, 0, 0) < 0){return 1;}
		printf("** Tracing %s\n", prog);
		// TODO: The &args looks weird...
		execvp(prog, args);
	}
	// Parent
	else{
		ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_EXITKILL);
	}
	return 0;	
}


int main(int argc, char** argv){
	struct args arg;
	parseArgs(argc, argv, &arg);	
	
	int st;	
	st = ANY;
	
	if(arg.s){
		cmdSetExecFilename(arg.prog);				
	}	
	
	while(1){	
		// Get next command and args
		// dispatch next command to correct function
		struct command cmd;
		if(cmdNext(&cmd, &st, &arg)){
			break;	
		}
	}
	return 0;
}
