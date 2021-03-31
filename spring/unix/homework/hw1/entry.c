#include "entry.h"
#define HCOMM 6385123249
// Hash the required files names 
// rather than calling strncmp a whole bunch
struct Parent* newParent()
{
	struct Parent* parent= malloc(sizeof(struct Parent));
	parent->child = NULL;
	parent->next = NULL;
	return parent;
}
struct Table* newTable()
{
	struct Table* table = malloc(sizeof(struct Table));	
	table->tail = NULL;
	table->head = NULL;
	return table;
}
int addTableEntry(struct Table* tb, struct Parent* pr)
{
	if(tb == NULL || pr == NULL){return 0;}
	// adding first element
	if(tb->tail != NULL){
		tb->tail->next = pr;
	}
	tb->tail = pr;
	return 1;
}
unsigned long _hash(const char* str)
{
	unsigned long hash = 5381;
	int c;
	while((c= *str++)){
		hash = ((hash << 5) + hash)	+ c;
	}	
	return hash;
}
void addPathName(char* procEntry, const char* procPath, const char* subDirName)
{
	snprintf(procEntry,
		strlen(procPath) + strlen(subDirName)+1,
		"%s%s//\n",
		procPath,
		subDirName
	);
	// Get the correct
	strcat(procEntry, "/");
}
void fillParent(struct Parent* parent, DIR* dir)
{
	struct dirent* ent;
	while((ent = readdir(dir)) != NULL){
		printf("\t%s\n", ent->d_name);	
	}
}
void fillEntry(struct Parent* parent, DIR* dir)
{	
	fillParent(parent, dir);
}
