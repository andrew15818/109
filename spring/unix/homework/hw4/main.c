#include <stdio.h>
#include <string.h>

#include "args.h"
#include "cmd.h"
void logDebug(const char* msg){
	printf("** %s\n", msg);
}
int main(int argc, char** argv){
	struct args arg;
	parseArgs(argc, argv, &arg);	
	
	enum state st;	
	st = ANY;
	
	while(1){
		// Get next command and args
		// dispatch next command to correct function
		if(cmdNext(&st, &arg)){
			break;	
		}
	}
	return 0;
}
