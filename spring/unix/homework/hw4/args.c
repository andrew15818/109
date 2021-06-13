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
	/*
	while((c = getopt(argc, argv, "s:")) != -1){
		if(c == 's'){
			arg->s = 1;
			strncpy(arg->script, optarg, strlen(optarg));
			arg->script[strlen(optarg)] = '\0';
			printf("**Found s: %d, script: %s\n", arg->s, arg->script);
		}else{
			printf("**Option %c not supported.\n", c);	
		}
	}
	*/
}
