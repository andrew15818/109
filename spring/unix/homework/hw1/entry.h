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
#include <regex.h>

#include "opts.h"
#define MAX 250
#define MED 20
#define MIN 10
struct fileDes{
	
	size_t inode;
	char fd[MIN];	
	char type[MIN];
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
int addChild(struct Parent*, struct fileDes*);
int isParentValid(struct Parent*, struct argTable*);
int isFdValid(struct fileDes*, struct argTable*);
void addPathName(char*, const char*, const char*);
void pGetUser(struct Parent*);
void fdFillStatInfo(struct fileDes*, const char*);
int fillEntry(struct Parent*, DIR* dir, struct argTable*); 
void fillParent(struct Parent*, struct argTable*);
void fillMem(struct Parent* par);
struct fileDes* defReadFile(struct Parent*, const char*);
void fillDefaultChildren(struct Parent*);
void fillChildren(struct Parent*, struct argTable*);
void fillChildFilename(struct Parent*, struct fileDes*, size_t);
void printChildren(struct Parent*);
void printTable(struct Table*);
#endif
