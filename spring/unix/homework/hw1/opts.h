#ifndef OPTS_H
#define OPTS_H
#include <unistd.h>
#include <stdio.h>
#include <regex.h>
#include <stdlib.h>
#include <string.h>

#define MAX 250
#define ARG_NUM 3
struct CmdLineArgs{
	int c, t, f;
	char opt[MAX];
	regex_t regex;
	struct CmdLineArgs* next;
} ;
struct argTable{
	struct CmdLineArgs* head;
	struct CmdLineArgs* tail;
};

struct CmdLineArgs* newCmdLineArgs();
struct argTable* newArgTable();
void addArgs(struct argTable*, struct CmdLineArgs*);
void parseOptions(struct argTable*, int, char**);
void printOpts(struct argTable* tb);
#endif
