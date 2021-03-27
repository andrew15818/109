#include "entry.h"

void getPathName(char* procEntry, char* procPath, const struct dirent* entry)
{
	snprintf(procEntry,
		strlen(procPath) + strlen(entry->d_name),
		"%s%s//\n",
		procPath,
		entry->d_name
	);
	// Get the correct
	strcat(procEntry, "/");
}
void getProcInfo(struct lsofEntry* lentry, const DIR* dir)
{

}
