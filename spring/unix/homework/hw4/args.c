#include "args.h"

void parseArgs(int argc, char** argv, struct args* arg){
	arg->s = 0;	
	// need to skip the arg after -s
	int sindex = 0;
	for(int i = 1; i < argc; i++){
		if(!strncmp("-s", argv[i], 2)){
			arg->s = 1;	
			sindex = i;
			// Does this work?
			if(argv[i + 1]){
				int argsize = strlen(argv[i+1]);
				strncpy(arg->script, argv[i + 1], argsize);	
				arg->script[argsize] = '\0';
				printf("** Reading from script %s\n", arg->script);
			}
		}else{
			// skip the script name
			if(i == sindex + 1){continue;}	
			strncpy(arg->prog, argv[i], strlen(argv[i]));
			arg->prog[strlen(argv[i])] = '\0';
			printf("** Executing %s\n", arg->prog);
		}
	}
	// if only the executable name is given
	if(arg->s == 0 && argc > 1){
		strncpy(arg->prog, argv[1], strlen(argv[1]));
		arg->prog[strlen(argv[1])] = '\0'; 
		printf("** Loading %s\n", arg->prog);
	}
}
