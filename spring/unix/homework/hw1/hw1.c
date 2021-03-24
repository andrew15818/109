#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <dirent.h>
/*
 * TODO: 
 * 	1. Mess w/ /proc to see needed info.
 * 	2. See how we can list or go through all the processes
 * 	3. For the data not available in stat, how do we find it? Manually parse /proc/pid/? 
 * */
#include "opts.h"

char* procPath = "/proc/";
int main(int argc, char *argv[]){
	struct CmdLineArgs args;
	parseOptions(&args, argc, argv);	

	// Similar to getopt(), get one dirent at a time
	DIR *dir;
	struct dirent *entry;

	if((dir = opendir(procPath)) == NULL){
		perror("opendir");	
	}
	while((entry= readdir(dir)) != NULL){
		printf("%s\n", entry->d_name);	
	}
	return 0;
}
