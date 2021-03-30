#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <string.h>
#include <stdlib.h>

#include "opts.h"
#include "entry.h"

char* procPath = "/proc/";
// since max length is 250
char procEntryName[251];
int main(int argc, char *argv[]){
	struct CmdLineArgs args;
	parseOptions(&args, argc, argv);	

	// Similar to getopt(), get one dirent at a time
	DIR *dir, *subDir;
	struct dirent *dirEntry;
	struct dirent *subDirEntry;
	

	if((dir = opendir(procPath)) == NULL){
		perror("opendir");	
	}
	// Read each directory in /proc
	while((dirEntry= readdir(dir)) != NULL){
		struct lsofEntry* lsEntry;
		getPathName(procEntryName, procPath, dirEntry->d_name);
		if((subDir= opendir(procEntryName)) == NULL){
			continue;
		}
		if(!strncmp(dirEntry->d_name, ".", strlen(dirEntry->d_name))
			|| !strncmp(dirEntry->d_name, "..", strlen(dirEntry->d_name))){
			printf("ran into it\n");	
			continue;
		}
		//printf("Viewing %s\n", dirEntry->d_name);
		printf("%d\n",atoi(dirEntry->d_name));
		lsEntry->pid = atoi(dirEntry->d_name);
		//getProcInfo(lsEntry, subDir);
	}
	return 0;
}
