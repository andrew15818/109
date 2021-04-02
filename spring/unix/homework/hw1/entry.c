#include "entry.h"
#define HCOMM 6385123249
#define HSTAT 6954030894409
// Hash the required files names 
// rather than calling strncmp a whole bunch
struct Parent* newParent()
{
	struct Parent* parent = malloc(sizeof(struct Parent));
	parent->head = NULL;
	parent->tail = NULL;
	parent->next = NULL;
	return parent;
}
struct fileDes* newFileDes()
{
	struct fileDes* child = malloc(sizeof(struct fileDes));
	child->next = NULL;
	return child;
}
struct Table* newTable()
{
	struct Table* table = malloc(sizeof(struct Table));	
	table->tail = NULL;
	table->head = NULL;
	return table;
}
int addParentEntry(struct Parent* parent, struct fileDes* fdes)
{
	if(parent  == NULL || fdes == NULL){
		printf("Null child or file descriptor.\n");	
		return 0;
	}
	if(parent->head == NULL){
		parent->head = fdes;	
	}
	if(parent->tail != NULL){
		parent->tail->next = fdes;
	}
	parent->tail = fdes;
	return 1;

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
void fillChildren(struct Parent* par)
{
	/* TODO:
	 * 1. Open /fd/ dir
	 * 2. For each entry make a new fileDes, add it to table
	 * 3. Fill in the info for each file descriptor
	 * */
	char fdPath[MAX];	
	DIR *fdDir;
	struct dirent* fd;
	snprintf(fdPath, MAX, "%s%s", par->path, "fd");
	if((fdDir = opendir(fdPath)) == NULL){
		perror("open");	
		return;
	}
	while((fd = readdir(fdDir)) != NULL){
		if((atoi(fd->d_name)) == 0){continue;}
		printf("\t%s\n", fd->d_name);	
		struct fileDes* fdes = newFileDes();
		addParentEntry(par, fdes);
	}

}
void fillParent(struct Parent* parent)
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
	fillParent(parent);
	printf("%s\t%ld\t%s\n", parent->command, parent->pid, parent->user);
	fillChildren(parent);
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
