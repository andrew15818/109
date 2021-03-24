#include "opts.h"

void parseOptions(struct CmdLineArgs* cmd, int argc, char** argv)
{	
	cmd->c_opt = NULL;
	cmd->t_opt = NULL;
	cmd->f_opt = NULL;
	int i, ch;	
	while((ch = getopt(argc, argv, "c:t:f:")) != -1){
		switch(ch){
			case 't':
				cmd->t_opt = optarg;
				printf("Option -%c with opt %s\n", ch, cmd->t_opt);
				break;
			case 'f':
				cmd->f_opt = optarg;
				printf("Option -%c with opt %s\n", ch, cmd->f_opt);
				break;
			case 'c':
				cmd->c_opt = optarg;
				printf("Option -%c with opt %s\n", ch, cmd->c_opt);
				break;
			case '?':
			case ':':
			default:
				printf("IN the switch\n");	
				break;
		}
	}
	return;
}
