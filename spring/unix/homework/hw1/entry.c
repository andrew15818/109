#include "entry.h"
#define TY_REG 100
#define TY_DIR 101
#define TY_CHR 102
#define TY_BLK 103
#define TY_FIFO 104
#define TY_LINK 105
#define TY_SOCK 106
#define TY_UNKN 107
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
	//child->type = 0;
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
	char buff[100];
	snprintf(tmp,  MAX, "%s%s/%ld", par->path,"fd", fd);
	// Get the name of the symbolic link file rather than info about the link
	readlink(tmp, fdes->filename, sizeof(fdes->filename));
	//printf("\tWorking filename: %s\n", fdes->filename);
}

// default cwd of process
struct fileDes* defReadFile(struct Parent* par, const char* file)
{
	char tmp[MAX];
	snprintf(tmp, MAX, "%s%s", par->path, file);
	struct fileDes* fd = newFileDes();
	int len = readlink(tmp, fd->filename, strlen(fd->filename));
	
	fd->filename[len] = '\0';
	//printf("\t%s\n", fd->filename);
	fdFillStatInfo(fd, tmp);
	strncpy(fd->fd, file, strlen(file));
	return fd;
}
void fillDefaultChildren(struct Parent* par)
{
	struct fileDes* fd = defReadFile(par, "cwd");
	addChild(par, fd);
	fd = defReadFile(par, "root");
	addChild(par, fd);
	fd = defReadFile(par, "exe");
	addChild(par, fd);
}

void fillMem(struct Parent* par)
{
	char tmp[MAX], line[MAX], a[MAX];	
	unsigned long from, to, pgoff, major, minor, flags;
	unsigned int ino;
	snprintf(tmp, MAX, "%s%s", par->path, "maps");
	FILE* fp = fopen(tmp, "r");
	if(fp != NULL){printf("Opened %s\n", tmp);}
	while(fgets(line, MAX-1, fp) != NULL){
		struct fileDes* fd = newFileDes();
		sscanf(line, "%x-%x %4c %x %x:%x %lu %s",
						&from, &to, &flags, &pgoff, &major, &minor, &ino, fd->filename);
		fdFillStatInfo(fd, fd->filename);
		strncpy(fd->fd, "mem", sizeof(fd->fd));
		strncpy(fd->type, "REG", sizeof(fd->type));
		printf("MEM process: %s %s %ld %s\n", fd->fd,fd->type ,fd->inode, fd->filename);
		addChild(par, fd);
	}	
}
void fdFillStatInfo(struct fileDes* fdes, const char* path)
{
	struct stat st;
	if((stat(path, &st)) == -1){return;}
		// File inode
		fdes->inode = st.st_ino;

		// Type of File Descriptor
		if(S_ISREG(st.st_mode)){
			strncpy(fdes->type, "REG", 4);	
		}else if(S_ISDIR(st.st_mode)){ 
			strncpy(fdes->type, "DIR", 4);	
		}else if(S_ISCHR(st.st_mode)){
			strncpy(fdes->type, "CHR", 4);	
		}else if(S_ISBLK(st.st_mode)){ 
			strncpy(fdes->type, "BLK", 4);	
		}else if(S_ISFIFO(st.st_mode)){
			strncpy(fdes->type, "FIFO", 5);	
		}else if(S_ISSOCK(st.st_mode)){
			strncpy(fdes->type, "SOCK", 5);	
		}else{
			strncpy(fdes->type, "unknown", 8);	
		}	
}
// TODO: Check for the matching regexes in children as well
void fillChildren(struct Parent* par, struct argTable* tb)
{
	fillDefaultChildren(par);
	fillMem(par);
	char fdPath[MAX];	
	DIR *fdDir;
	struct dirent* fd;
	struct stat st;
	snprintf(fdPath, MAX, "%s%s", par->path, "fd");
	if((fdDir = opendir(fdPath)) == NULL){
		// TODO: If cant' open /fd have to mark child as empty, not just print error
		perror("open");	
		return;
	}
	
	while((fd = readdir(fdDir)) != NULL){
	
		if((atoi(fd->d_name)) == 0){continue;}
		//printf("\t%s\n", fd->d_name);	
		snprintf(fdPath, MAX, "%s%s%s", par->path, "fd/", fd->d_name);
	

		struct fileDes* fdes = newFileDes();
		
		fdFillStatInfo(fdes, fdPath);
		
		fillChildFilename(par, fdes, atoi(fd->d_name));
		// Check if the entry matches cmdline args
		
		if(!isFdValid(fdes, tb)){
			free(fdes);	
			continue;	
		}
		
		//printf("%s %ld %ld file: %s is valid\n", par->command, par->pid, fdes->inode, fdes->filename);
		addChild(par, fdes);
	}

}
void fillParent(struct Parent* parent, struct argTable* tb)
{
	char statFile[MAX];
	snprintf(statFile, MAX, "/proc/%d/comm", parent->pid);
	FILE* fp = fopen(statFile, "r");
	if(fp == NULL){
		perror("open");
	}
	fscanf(fp, "%s", parent->command);
	pGetUser(parent);
}
// Only have to check the command name at the parent level
int isParentValid(struct Parent* par, struct argTable* tb)
{
	struct CmdLineArgs* sent = tb->tail;
	while(sent != NULL){
		if(sent->c){
			return !regexec(&sent->regex, par->command, 0, NULL, 0);
		}
		sent = sent->next;	
	}
	return 1;
}
int isFdValid(struct fileDes* fd, struct argTable* tb)
{
	struct CmdLineArgs* sent = tb->tail;	
	int flagt = 1, flagf = 1;
	while(sent != NULL){
		if(sent->t){
			flagt = !regexec(&sent->regex, fd->type, 0, NULL, 0);		
		}
		if(sent->f){
			flagf = !regexec(&sent->regex, fd->filename, 0, NULL, 0);	
		}
		sent = sent->next;	
	}

	return (flagt && flagf);
}
int fillEntry(struct Parent* parent, DIR* dir, struct argTable* tb)
{	
	fillParent(parent, tb);
	// Just when there is a regex
	
	if(!isParentValid(parent, tb)){
		free(parent);
		return 0;
	}
	
	fillChildren(parent, tb);
	return 1;
}
// Start the head and print all the children
void printChildren(struct Parent* par)
{
	struct fileDes* sent = par->head;	
	while(sent != NULL){
		
		printf("%s %ld %s ", 
				par->command, 
				par->pid,
				par->user);
		
		printf("%s %s %ld  %s\n", 
				sent->fd,
				sent->type,
				sent->inode,
				sent->filename);
		
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
