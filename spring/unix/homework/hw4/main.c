#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ptrace.h>
#include <assert.h>
#include <stdlib.h>
#include <unistd.h>
#include <elf.h>

#include "cmd.h"
#include "args.h"


void logDebug(const char* msg){
	printf("** %s\n", msg);
}

int main(int argc, char** argv){
	struct args arg;
	parseArgs(argc, argv, &arg);	

	int st;	
	struct command tmp;
	cmdSetState(&st, ANY);
	

	if(arg.p){
		cmdSetExecFilename(arg.prog);				
		cmdLoad(&tmp, &st); 
	}
	if(arg.s){
		cmdSetScript(arg.script);
	}
			
	
	while(1){	
		// Get next command and args
		// dispatch next command to correct function
		struct command cmd;
		// Once the command is done
		if(cmdNext(&cmd, &st, &arg)){
			cmdSetState(&st, ANY);
			continue; // Just continue and reset?
		}
	}
	return 0;
}
