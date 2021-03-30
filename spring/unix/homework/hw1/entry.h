#ifndef ENTRY_H
#define ENTRY_H
#include <dirent.h>
#include <stdio.h>
#include <string.h>

#define MAX 250
#define MED 20
#define MIN 10
struct lsofEntry{
	char command[MAX];
	//char pid[MED];
	//size_t pid;
	int pid;
	char user[MAX];
	size_t 		fd;
	char mode[MED];
	char type[MED];
	size_t 		inode;
	char filename[MAX];
};
unsigned long _hash(const char*);
void getPathName(char*, const char*, const char*);
void getProcInfo(struct lsofEntry*, DIR*);
#endif
