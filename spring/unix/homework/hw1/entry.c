#include "entry.h"
// Hash the required files names 
// rather than calling strncmp a whole bunch
struct lsofEntry* newLSOFEntry()
{
	struct lsofEntry* entry = (struct lsofEntry*)malloc(sizeof(struct lsofEntry));
	entry->next= NULL;
	return entry;
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
void getPathName(char* procEntry, const char* procPath, const char* subDirName)
{
	snprintf(procEntry,
		strlen(procPath) + strlen(subDirName),
		"%s%s//\n",
		procPath,
		subDirName
	);
	// Get the correct
	strcat(procEntry, "/");
}
void getProcInfo(struct lsofEntry* lentry, DIR* dir)
{
	char filename[250] = "/proc/";
	char tmp[12];
	sprintf(tmp, "%d\n", lentry->pid);
	printf("turn int to str: %s\n", tmp);
	//getPathName(filename, filename, tmp);
	struct dirent* procInfo;
	while((procInfo = readdir(dir)) != NULL){
		printf("\tReading %s\n", procInfo->d_name);	
	}
}
