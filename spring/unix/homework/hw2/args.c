#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include "args.h"
void getArgs(struct args* ag, int argc, char** argv){
	int c;
	while((c = getopt(argc, argv, "p:o:")) != -1){
		switch(c){
			case 'p':
				ag->p = 1;
				printf("Option that came along with -p: %s\n", optarg);
				break;
			case 'o':
				ag->o = 1;
				printf("Option with -o: %s\n", optarg);
			case '?':
				printf("Option has no argument.\n");
				break;
			default:
				break;	
		}
	}
}
