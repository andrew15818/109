#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
#include <string.h>
/*
 * TODO: 
 * 	1. Mess w/ /proc to see needed info.
 * 	2. See how we can list or go through all the processes
 * 	3. For the data not available in stat, how do we find it? Manually parse /proc/pid/? 
 * */
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
	
	struct lsofEntry* procInfo;	

	if((dir = opendir(procPath)) == NULL){
		perror("opendir");	
	}
	// Read each directory in /proc
	while((dirEntry= readdir(dir)) != NULL){
		getPathName(procEntryName, procPath, dirEntry);
		printf("%s\n", procEntryName);
		if((subDir= opendir(procEntryName)) == NULL){
			continue;
		}
		getProcInfo(procInfo, subDir);
	}
	return 0;
}
