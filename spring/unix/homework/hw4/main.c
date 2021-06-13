#include <stdio.h>
#include <string.h>

#include "args.h"
void logDebug(const char* msg){
	printf("** %s\n", msg);
}
int main(int argc, char** argv){
	struct args arg;
	parseArgs(argc, argv, &arg);	
	return 0;
}
