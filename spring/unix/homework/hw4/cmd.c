#include "cmd.h"
#include <unistd.h>

#define STR_MAX 256
/* Get the next command
 * @state:  program state, some commands depend
 * @arg: whether -s given or not
 * */
int cmdNext(enum state* st, struct args* arg){
	struct command cmd;

	cmdFromUser(&cmd);
	return 1;
}
void cmdFromUser(struct command* cmd){
	char buf[STR_MAX];
	printf("sdb>");
	fgets(buf, STR_MAX, stdin);
	printf("%s\n", buf);

	return;
}

