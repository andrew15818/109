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
	struct lsofEntry* tail;
	

	if((dir = opendir(procPath)) == NULL){
		perror("opendir");	
	}
	// Read each directory in /proc
	while((dirEntry= readdir(dir)) != NULL){
		struct lsofEntry* lsEntry = newLSOFEntry();
		
		tail->next = lsEntry;
		tail = lsEntry;

		// Join the two string pathnames
		getPathName(procEntryName, procPath, dirEntry->d_name);
		if((subDir= opendir(procEntryName)) == NULL){
			continue;
		}
		// skip the current and parent dirs
		if(!strncmp(dirEntry->d_name, ".", strlen(dirEntry->d_name))
			|| !strncmp(dirEntry->d_name, "..", strlen(dirEntry->d_name))){
			continue;
		}

		lsEntry->pid = atoi(dirEntry->d_name);
		//getProcInfo(lsEntry, subDir);
		printf("%ld\n", _hash("comm"));
	}
	return 0;
}
