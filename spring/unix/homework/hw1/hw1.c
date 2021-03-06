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
	struct argTable* argtb = newArgTable(); 
	parseOptions(argtb, argc, argv);	
	/*
	printf("====Printing Options====\n");
	printOpts(argtb);
	printf("====Done====\n");
	*/
	int n;

	// Similar to getopt(), get one dirent at a time
	DIR *dir, *subDir;
	struct dirent **processes;
		

	// Read each directory in /proc
	n = scandir(procPath, &processes, NULL, alphasort);
	if(n == -1){
		perror("scandir");	
		exit(EXIT_FAILURE);
	}
	struct Table* table = newTable();
	int i = 0;
	// Open the sorted dir
	while(i < n){
		if(!strcmp(processes[i]->d_name, ".")
			|| !strcmp(processes[i]->d_name, "..")){
			i++;
			continue;
		}
		//
		addPathName(procEntryName, 
					procPath, 
					processes[i]->d_name);

		subDir = opendir(procEntryName);
		if(subDir == NULL){
			i++;
			continue;
		}
		// Non-dir entries will return zero, can skip
		if(atoi(processes[i]->d_name) == 0){continue;}
	
		struct Parent *process = newParent();
		strncpy(process->path, procEntryName, sizeof(procEntryName));
		process->path[strlen(procEntryName)] = '\0';
		process->pid = atoi(processes[i]->d_name);
		
		if(fillEntry(process, subDir, argtb)){
			addTableEntry(table, process);	
		}
		//
		i++;
	}
	//closedir(subDir);

	printTable(table);		
	return 0;
}
