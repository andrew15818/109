#include "entry.h"
#define TY_REG 100
#define TY_DIR 101
#define TY_CHR 102
#define TY_BLK 103
#define TY_FIFO 104
#define TY_LINK 105
#define TY_SOCK 106
#define TY_UNKN 107
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
	child->type = 0;
	return child;
}
struct Table* newTable()
{
	struct Table* table = malloc(sizeof(struct Table));	
	table->tail = NULL;
	table->head = NULL;
	return table;
}
int addChild(struct Parent* parent, struct fileDes* fdes)
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
void fillChildFilename(struct Parent* par, struct fileDes* fdes, size_t fd)
{
	char tmp[MAX];
	snprintf(tmp,  MAX, "%s%s/%ld", par->path,"fd", fd);
	// Get the name of the symbolic link file rather than info about the link
	readlink(tmp, fdes->filename, MAX);
	//printf("Working filename: %s\n", fdes->filename);
}
void fillChildren(struct Parent* par)
{
	char fdPath[MAX];	
	DIR *fdDir;
	struct dirent* fd;
	struct stat st;
	snprintf(fdPath, MAX, "%s%s", par->path, "fd");
	if((fdDir = opendir(fdPath)) == NULL){
		perror("open");	
		return;
	}
	
	while((fd = readdir(fdDir)) != NULL){
	
		if((atoi(fd->d_name)) == 0){continue;}
		//printf("\t%s\n", fd->d_name);	
		snprintf(fdPath, MAX, "%s%s%s", par->path, "fd/", fd->d_name);
		if((stat(fdPath, &st)) == -1){/*printf("\nSkipping dir\n");*/continue;}

		struct fileDes* fdes = newFileDes();
		addChild(par, fdes);

		// File inode
		fdes->inode = st.st_ino;

		// Type of File Descriptor
		if(S_ISREG(st.st_mode)){
			fdes->type=TY_REG;
			fillChildFilename(par, fdes, atoi(fd->d_name));	
		}
		else if(S_ISDIR(st.st_mode)){ 
			fdes->type=TY_DIR;
			fillChildFilename(par, fdes, atoi(fd->d_name));		
		}
		else if(S_ISCHR(st.st_mode)){fdes->type=TY_CHR; }
		else if(S_ISBLK(st.st_mode)){ fdes->type=TY_BLK;}
		else if(S_ISFIFO(st.st_mode)){fdes->type=TY_FIFO;}
		else if(S_ISLNK(st.st_mode)){ fdes->type=TY_LINK;}
		else if(S_ISSOCK(st.st_mode)){fdes->type=TY_SOCK;}	
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
	fillChildren(parent);
}
// Start the head and print all the children
void printChildren(struct Parent* par)
{
	struct fileDes* sent = par->head;	
	printf("pid:%d\n",par->pid);
	//printf("%s\t%ld\t%s\n", parent->command, parent->pid, parent->user);
	while(sent != NULL){
		
		printf("%s %ld %s ", 
				par->command, 
				par->pid,
				par->user);
		
		printf("%ld %ld  %s\n", 
				sent->type,
				sent->inode,
				sent->filename);
		
		//printf("\n\tMoving to next hcild\n");
		sent = sent->next;	
	}
}
void printTable(struct Table* tb)
{
	printf("COMMAND PID USER TYPE NODE NAME\n");
	struct Parent* sent = tb->head;
	while(sent != NULL){
		printChildren(sent);
		sent = sent->next;	
	}
	return;
}
