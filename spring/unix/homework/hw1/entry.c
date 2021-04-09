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
	memset(child->type, '\0', sizeof(child->type));
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
		//perror("open");	
		return;
	}
	struct passwd *pwd;
	if((pwd = getpwuid(st.st_uid)) == NULL){
		printf("Error getting Userid for %s\n", par->pid);	
	}
	//strncpy(par->user, pwd->pw_name, strnlen(pwd->pw_name));
	snprintf(par->user, strnlen(pwd->pw_name, MAX)+1, "%s", pwd->pw_name);
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
	int len = readlink(tmp, fd->filename, sizeof(fd->filename));
	if(len == -1 ){
		snprintf(fd->filename, sizeof(fd->filename), "%s %s", fd->filename, "(readlink: Permission denied)");
	}
	else{	
		fd->filename[len] = '\0';
	}
	//printf("\t%s\n", fd->filename);
	fdFillStatInfo(fd, tmp);
	strncpy(fd->fd, file, sizeof(file));
	return fd;
}
void fillDefaultChildren(struct Parent* par, struct argTable* tb)
{
	struct fileDes* fd = defReadFile(par, "cwd");
	if(!isFdValid(fd, tb)){free(fd);}
	else{addChild(par, fd);}
	fd = defReadFile(par, "root");
	if(!isFdValid(fd, tb)){free(fd);}
	else{addChild(par, fd);}
	fd = defReadFile(par, "exe");
	if(!isFdValid(fd, tb)){free(fd);}
	else{addChild(par, fd);}

}
void checkMemfileDeleted(struct fileDes* fd)
{
	if(strstr(fd->filename, "(deleted)") == NULL){
		return;	
	}
	strncpy(fd->fd, "del", sizeof(fd->fd));
}
void fillMem(struct Parent* par, struct argTable* tb)
{
	char tmp[MAX], line[MAX], a[MAX];	
	unsigned long from, to, pgoff, major, minor, flags;
	unsigned int ino;
	snprintf(tmp, MAX, "%s%s", par->path, "maps");
	FILE* fp = fopen(tmp, "r");
	if(fp == NULL){return;}
	while(fgets(line, MAX-1, fp) != NULL){
		struct fileDes* fd = newFileDes();
		sscanf(line, "%x-%x %4c %x %x:%x %lu %s",
						&from, &to, &flags, &pgoff, &major, &minor, &ino, fd->filename);
		fdFillStatInfo(fd, fd->filename);
		strncpy(fd->fd, "mem", sizeof(fd->fd));
		strncpy(fd->type, "REG", sizeof(fd->type));
		checkMemfileDeleted(fd);

		if(!isFdValid(fd, tb)){
			free(fd);	
			continue;
		}
	
		addChild(par, fd);
	}	
}
void fdFillStatInfo(struct fileDes* fdes, const char* path)
{
	struct stat st;
	if((stat(path, &st)) == -1){
		snprintf(fdes->type, MIN, "unknown");			
		return;
	}
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
void fdFillFdInfo(struct fileDes* fd, const char* path, const char* fdname)
{
	struct stat st;
	char perm;
	int filedes = open(path, O_RDONLY);
	if(filedes == -1){
		snprintf(fd->type, MIN, "unknown");;
		return;
	}
	//printf("\tOpening %s", path);
	//printf("\t\t%d\n", filedes);
	int read = 0, write = 0;
	fstat(filedes, &st);
	if(st.st_mode & S_IRUSR){
		perm = 'r';	read = 1;
	}if(st.st_mode & S_IWUSR){
		perm = 'w'; write = 1;
	}if(read && write){
		perm = 'u';
	}
	snprintf(fd->fd, sizeof(fd->fd), "%s%c", fdname, perm);
	//printf("access: %s\n", fd->fd);
	close(filedes);
}
// TODO: Check for the matching regexes in children as well
// - Also check why we're printing some weird info
void fillChildren(struct Parent* par, struct argTable* tb)
{
	// The exe, root, cwd, and mem children
	fillDefaultChildren(par, tb);
	fillMem(par, tb);
	char fdPath[MAX];	
	DIR *fdDir;
	struct dirent* fd;
	struct stat st;
	snprintf(fdPath, MAX, "%s%s", par->path, "fd");
	// How to check if this failed due to permission?
	if((fdDir = opendir(fdPath)) == NULL ){
		struct fileDes* fdes = newFileDes();	
		strncpy(fdes->fd, "NOFD", sizeof(fdes->fd));	
		snprintf(fdes->filename, sizeof(fdes->filename)-1, "%s %s", fdPath, "(opendir: Permission denied)");
		addChild(par, fdes);
		return;
	}
	
	// The fd's in the /fd subdir	
	while((fd = readdir(fdDir)) != NULL){
	
		if((atoi(fd->d_name)) == 0){continue;}
		//printf("\t%s\n", fd->d_name);	
		snprintf(fdPath, MAX, "%s%s%s", par->path, "fd/", fd->d_name);
	

		struct fileDes* fdes = newFileDes();
		
		fdFillStatInfo(fdes, fdPath);
		
		fillChildFilename(par, fdes, atoi(fd->d_name));
		// Check if the entry matches cmdline args
		fdFillFdInfo(fdes, fdPath, fd->d_name);	
		if(!isFdValid(fdes, tb)){
			//printf("\tNOT including %s %s %s\n", par->command, fdes->type, fdes->filename);
			free(fdes);	
			continue;	
		}
		//printf("\tINCLUDING %s %s %s\n", par->command, fdes->type, fdes->filename);
		printf("Adding Child: %s\n", fdes->filename);
		addChild(par, fdes);
	}

}
void fillParent(struct Parent* parent, struct argTable* tb)
{
	char statFile[MAX];
	snprintf(statFile, MAX, "/proc/%d/comm", parent->pid);
	FILE* fp = fopen(statFile, "r");
	if(fp == NULL){
		//perror("open");
		return;
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
			//printf("%s and type %s match: %d\n", sent->opt, fd->type, flagt);
		}
		if(sent->f){
			flagf = !regexec(&sent->regex, fd->filename, 0, NULL, 0);	
			//printf("%s and type %s match: %d\n", sent->opt, fd->filename, flagf);
		}
		sent = sent->next;	
	}

	return (flagt && flagf);
}
void printProcChildren(struct Parent* par){
	struct fileDes* sent = par->tail;
	while(sent != NULL){
		//printf("\t%s passed\n", sent->filename);	
		sent = sent->next;
	}
}
int fillEntry(struct Parent* parent, DIR* dir, struct argTable* tb)
{	
	fillParent(parent, tb);
	// Just when there is a regex
	
	if(!isParentValid(parent, tb)){
		free(parent);
		return 0;
	}
	//printf("%s made it through\n", parent->command);	
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
	//printf("COMMAND PID USER TYPE NODE NAME\n");
	struct Parent* sent = tb->head;
	while(sent != NULL){
		printChildren(sent);
		sent = sent->next;	
	}
	return;
}
