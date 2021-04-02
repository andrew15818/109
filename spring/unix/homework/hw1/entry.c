#include "entry.h"
#define HCOMM 6385123249
#define HSTAT 6954030894409
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
	if(tb->head == NULL){
		tb->head = pr;	
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
// Get the user id first and get the username from getpwuid()
void pGetUser(struct Parent* par){
	struct stat st;
	int ret = stat(par->path, &st);
	if(ret < 0){
		perror("open");	
		return;
	}
	struct passwd *pwd;
	if((pwd = getpwuid(st.st_uid)) == NULL){
		printf("Error getting Userid for %s\n", par->pid);	
	}
	strncpy(par->user, pwd->pw_name, strlen(pwd->pw_name));
	//printf("%s\n", par->user);
}
void fillParent(struct Parent* parent, DIR* dir)
{
	char statFile[MAX];
	snprintf(statFile, MAX, "/proc/%d/comm", parent->pid);
	//printf("%s\n", statFile);
	FILE* fp = fopen(statFile, "r");
	if(fp == NULL){
		perror("open");
	}
	fscanf(fp, "%s", parent->command);
	pGetUser(parent);
}
void fillEntry(struct Parent* parent, DIR* dir)
{	
	fillParent(parent, dir);
	printf("%s\t%ld\t%s\n", parent->command, parent->pid, parent->user);
}
void printTable(struct Table* tb)
{
	struct Parent* sent = tb->head;
	while(sent != NULL){
		printf("Process: %s\n", sent->command);
		sent = sent->next;	
	}
	return;
}
