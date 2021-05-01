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
#define BUFLEN 32
void getRealPathName(const char* pathName, char* buf)
{
	char* res = realpath(pathName, buf);	
	if(res == NULL){
		strncpy(buf, pathName, strlen(pathName));
		buf[strlen(pathName)] = '\0';
		return;	
	}
}
// This is run on the character buffer arguments
void checkPrintableChars(char* buf, int size)
{
	// Check here if there are more than 32 chars,
	// directly append NULL at the end in case
	for(int i = 0; i < size; i++){
		buf[i] = isprint(buf[i])?buf[i]:'.';
	}
}

// We only print up to 32 chars in character buffer
// Should only be used w/ char buffer parameter
void setBufLength(char* buf)
{
	if (strlen(buf) > BUFLEN){
		buf[BUFLEN]	= '\0';
	}
}
void handlePathName(const char* path, char* buf)
{
	getRealPathName(path, buf);	
	//Maybe just use this function on char buffer?
	checkPrintableChars(buf, strlen(buf));
}
void readFdSymlink(int fd, char* buf, int bufSize)
{
	pid_t pid = getpid();
	snprintf(buf, bufSize, "/proc/%d/fd/%d", pid, fd);
	if(readlink(buf, buf, bufSize) == -1){
		perror("read");	
	}
}
void paramFp(FILE* fp, char* buf, int size)
{
	int fd = fileno(fp);
	if(fd == -1){
		perror("file pointer");
		return;
	}
	readFdSymlink(fd, buf, size);
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
	int (*old_chmod)(const char* path, mode_t mode) = NULL;
	int res;
	char buf[PATH_MAX];
	handlePathName(path, buf);
	old_chmod =  getOrigFuncPtr("chmod");
	if(old_chmod == NULL){
		printf("Error getting chmod.\n");
		return 0;	
	}
	res = old_chmod(path, mode);
	printf("[logger] chmod(\"%s\", %o) = %d\n", 
			buf, mode, res);
	return res;
}
int close(int filedes)
{
	char buf[PATH_MAX]; 	// store symlink name
	char path[PATH_MAX]; 	// path to symlink
	int (*old_close)(int fd) = NULL;
	int res;
	readFdSymlink(filedes, path, PATH_MAX);	
	old_close = getOrigFuncPtr("close");	
	res = old_close(filedes);

	printf("[logger] close(\"%s\") = %d\n", path, res);
	return res;
}
int open(const char* path, int oflags, mode_t mode)
{	
	char buf[PATH_MAX];
	int res;
	handlePathName(path, buf);
	int (*old_open)(const char*, int , mode_t) = NULL;
	old_open = getOrigFuncPtr("open");

	res = old_open(path, oflags, mode);	
	printf("[logger] open(\"%s\", %d, %o) = %d\n", buf, oflags, mode, res);
	return res;
}
int chown(const char* path, uid_t owner, gid_t group)
{
	char buf[PATH_MAX];
	int res;
	int (*old_chown)(const char* , uid_t , gid_t ) = NULL;
	handlePathName(path, buf);
	old_chown = getOrigFuncPtr("chown");
	if(old_chown == NULL){
		printf("Error retrieving chown symbol.\n");	
		return -1;
	}
	res = old_chown(path, owner, group);
	printf("[logger] chown(\"%s\", %o, %o) = %d\n",
					buf, owner, group, res);
	return res;
}
ssize_t read(int fd, void* buf, size_t nbyte)
{
	char sympath[nbyte+1];
	int res;
	ssize_t (*old_read)(int, void*, size_t);	
	readFdSymlink(fd, sympath, nbyte+1);	
	old_read = getOrigFuncPtr("read");
	if(old_read == NULL){
		perror("read");	
		return -1;
	}
	res = old_read(fd, buf, nbyte);
	printf("[logger] read(\"%s\", \"%s\", %d) = %d\n", 
			sympath, buf, nbyte, res);
	return res;
}
int remove(const char* filename)
{
	int (*old_remove)(const char*);
	char buf[PATH_MAX];
	int res;
	old_remove = getOrigFuncPtr("remove");
	handlePathName(filename, buf);
	if(old_remove == NULL){
		perror("remove");
		return -1;
	}
	res = old_remove(filename);
	printf("[logger] remove(\"%s\") = %d\n", buf, res);
	return res;
}
int creat(const char* path, mode_t mode)
{
	 char fullpath[PATH_MAX];
	 int (*old_creat)(const char*, mode_t);
	 int res;

	 handlePathName(path, fullpath);
	 old_creat = getOrigFuncPtr("creat");
	 if(old_creat == NULL){
		perror("creat");
		return -1; 
	 }
	 res = old_creat(fullpath, mode);
	 printf("[logger] creat(\"%s\", %o) = %d\n", fullpath, mode, res);
	 return res;
}
int rename(const char* old_filename, const char* new_filename)
{
	char old_buf[PATH_MAX], new_buf[PATH_MAX];
	int (*old_rename)(const char*, const char*);
	int res;
	handlePathName(old_filename, old_buf);
	handlePathName(new_filename, new_buf);
	old_rename = getOrigFuncPtr("rename");
	if(old_rename == NULL){
		perror("rename");
		return -1;	
	}
	res = old_rename(old_buf, new_buf);	
	printf("[logger], rename(\"%s\", \"%s\") = %d\n", old_buf, new_buf, res);
	return res;	
}
int fclose(FILE* stream)
{
	char buf[PATH_MAX];
	int res;
	int (*old_fclose)(FILE*);

	paramFp(stream, buf, PATH_MAX);
	printf("Finna close %s\n", buf);
	old_fclose = getOrigFuncPtr("fclose");
	if(old_fclose == NULL){
		perror("fclose");	
		return -1;
	}
	printf("[logger] fclose(\"%s\") = %d\n", buf, res);
	return res;
}
FILE* fopen(const char* filename, const char* mode)
{

}
