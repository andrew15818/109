#include <stdio.h>
#include <dlfcn.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <limits.h> // for PATH_MAX
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <unistd.h>

#include "args.h"
void getRealPathName(const char* pathName, char* buf)
{
	char* res = realpath(pathName, buf);	
	if(res){
		return;	
	}
	strncpy(buf, pathName, sizeof(pathName));
}
void fileNameFromFd()
{
	
}
void checkPrintableChars(char* buf, int size)
{
	for(int i = 0; i < size; i++){
		buf[i] = isprint(buf[i])?buf[i]:'.';
	}
}
void* getOrigFuncPtr(const char* function)
{
	void* orig;
	void* handle = dlopen("libc.so.6", RTLD_LAZY);
	if(handle == NULL){return NULL;}	
	// Get the original function ptr from
	// shared object
	orig = dlsym(handle, function);
	return orig;
}

int chmod(const char* path, mode_t mode)
{
	return 0;
}
int close(int filedes)
{
	printf("\tclose received fd: %d\n", filedes);
	pid_t pid = getpid();
	char buf[PATH_MAX]; 	// store symlink name
	char path[PATH_MAX]; 	// path to symlink
	int (*old_close)(int fd) = NULL;
	int res;

	snprintf(path, sizeof(path), "/proc/%d/fd/%d", pid, filedes);
	if(readlink(path, buf, sizeof(buf)) == -1){
		perror("read");	
	}
	old_close = getOrigFuncPtr("close");	
	res = old_close(filedes);
	printf("[logger] close(\"%s\") = %d\n", path, res);
	return res;
}
int open(const char* path, int oflags, mode_t mode)
{	
	char buf[PATH_MAX];
	int res;
	getRealPathName(path, buf);
	checkPrintableChars(buf, strlen(buf));
	int (*old_open)(const char*, int , mode_t) = NULL;
	old_open = getOrigFuncPtr("open");

	res = old_open(path, oflags, mode);	
	printf("[logger] open(\"%s\", %d, %o) = %d\n", buf, oflags, mode, res);
	return res;
}
ssize_t read(int filedes, void* buf, size_t nbyte)
{
	
}
