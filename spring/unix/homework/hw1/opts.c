#include "opts.h"

struct CmdLineArgs* newCmdLineArgs()
{
	struct CmdLineArgs* cmd = malloc(sizeof(struct CmdLineArgs));
	cmd->c = cmd->t = cmd->f = 0;
	cmd->next = NULL;
	return cmd;
}
struct argTable* newArgTable()
{
	struct argTable* tb = malloc(sizeof(struct argTable));
	tb->head = tb->tail = NULL;
	return tb;
}
void printOpts(struct argTable* tb)
{
	struct CmdLineArgs* sent = tb->tail;
	while(sent != NULL){
		printf("\tOption: c:%d, t:%d, f:%d, opt:%s\n", sent->c, sent->t, sent->f, sent->opt);
		sent = sent->next;
	}
}
void addArgs(struct argTable* tb, struct CmdLineArgs* arg)
{
	if(tb == NULL || arg == NULL){return;}
	// The first element we're adding
	if(tb->tail == NULL && tb->head == NULL){
		tb->tail = tb->head = arg;
		return;
	}	
	tb->head->next = arg;	
	tb->head = arg;
}
void parseOptions(struct argTable* tb, int argc, char** argv)
{	
	int i, ch;	
	while((ch = getopt(argc, argv, "c:t:f:")) != -1){
		struct CmdLineArgs* cmd = newCmdLineArgs();
		addArgs(tb, cmd);
		switch(ch){
			case 't':
				cmd->t = 1;
				strncpy(cmd->opt, optarg, MAX);
				regcomp(&cmd->regex, cmd->opt, REG_EXTENDED);
				//printf("Option -%c with opt %s\n", ch, cmd->opt);
				break;
			
			case 'f':
				cmd->f = 1;
				strncpy(cmd->opt, optarg, sizeof(cmd->opt));	
				regcomp(&cmd->regex, cmd->opt, REG_EXTENDED);
				//printf("Option -%c with opt %s\n", ch, cmd->opt);
				break;
			case 'c':
				cmd->c = 1;
				strncpy(cmd->opt, optarg, sizeof(cmd->opt));	
				//printf("Option -%c with opt %s\n", ch, cmd->opt);
				regcomp(&cmd->regex, cmd->opt, REG_EXTENDED);
				break;
			case '?':
			case ':':
			default:
				//printf("IN the switch\n");	
				break;
		}
	}
	return;
}
