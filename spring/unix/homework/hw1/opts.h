#include <unistd.h>
#include <stdio.h>
#ifndef OPTS_H
#define OPTS_H

struct CmdLineArgs{
	int c, t, f;
	char *c_opt;
	char *t_opt;
	char *f_opt;;
} ;

void parseOptions(struct CmdLineArgs*, int, char**);

#endif
