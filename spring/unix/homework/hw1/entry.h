#ifndef ENTRY_H
#define ENTRY_H
#include <dirent.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <pwd.h>

#define MAX 250
#define MED 20
#define MIN 10
struct fileDes{
	size_t fd;	
	size_t type;
	size_t node;
	char filename[MAX];
	struct fileDes* next;
};
struct Parent{
	char command[MAX];
	size_t pid;
	char user[MAX];
	char path[MAX];
	struct fileDes* head;
	struct fileDes* tail;
	struct Parent* next;
};
struct Table{

	struct Parent* tail;
   	struct Parent* head;
};

struct Table* newTable();
struct Parent* newParent();
struct fileDes* newFileDes();

int addTableEntry(struct Table*, struct Parent*);
int addParentEntry(struct Parent*, struct fileDes*);
void addPathName(char*, const char*, const char*);
void pGetUser(struct Parent*);
void fillEntry(struct Parent*, DIR* dir); 
void fillParent(struct Parent*);
void fillChildren(struct Parent*);
void printTable(struct Table*);
#endif
