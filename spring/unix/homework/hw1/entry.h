#ifndef ENTRY_H
#define ENTRY_H
#include <dirent.h>
#include <stdio.h>
#include <string.h>

struct lsofEntry{
	char* command;
	char* pid;
	char* user;
	size_t fd;
	char* mode;
	char* type;
	size_t inode;
	char* filename;
};

void getPathName(char*, char*, const struct dirent*);
void getProcInfo(struct lsofEntry*, const DIR*);
#endif
