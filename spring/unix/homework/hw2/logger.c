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
	fprintf(stderr,"[logger] chmod(\"%s\", %o) = %d\n", 
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

	fprintf(stderr,"[logger] close(\"%s\") = %d\n", path, res);
	return res;
}
int open(const char* path, int oflags, mode_t mode)
{	
	char buf[PATH_MAX];
	int res;
	handlePathName(path, buf);
	int (*old_open)(const char*, int , mode_t) = NULL;
	old_open = getOrigFuncPtr("open64");

	res = old_open(path, oflags, mode);	
	fprintf(stderr,"[logger] open(\"%s\", %d, %o) = %d\n", buf, oflags, mode, res);
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
	fprintf(stderr,"[logger] chown(\"%s\", %o, %o) = %d\n",
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
	fprintf(stderr,"[logger] read(\"%s\", \"%s\", %d) = %d\n", 
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
	fprintf(stderr,"[logger] remove(\"%s\") = %d\n", buf, res);
	return res;
}
int creat(const char* path, mode_t mode)
{
	 char fullpath[PATH_MAX];
	 int (*old_creat)(const char*, mode_t);
	 int res;

	 handlePathName(path, fullpath);
	 old_creat = getOrigFuncPtr("creat64");
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
	int (*old_rename)(const char*, const char*) = NULL;
	int res;
	handlePathName(old_filename, old_buf);
	handlePathName(new_filename, new_buf);
	old_rename = getOrigFuncPtr("rename");
	if(old_rename == NULL){
		perror("rename");
		return -1;	
	}
	res = old_rename(old_buf, new_buf);	
	fprintf(stderr,"[logger] rename(\"%s\", \"%s\") = %d\n", old_buf, new_buf, res);
	return res;	
}
int fclose(FILE* stream)
{
	char buf[PATH_MAX];
	int res;
	int (*old_fclose)(FILE*) = NULL;

	paramFp(stream, buf, PATH_MAX);
	old_fclose = getOrigFuncPtr("fclose");
	if(old_fclose == NULL){
		perror("fclose");	
		return -1;
	}
	fprintf(stderr,"[logger] fclose(\"%s\") = %d\n", buf, res);
	return res;
}
FILE* fopen(const char* filename, const char* mode)
{
	char buf[PATH_MAX];	
	// we can't change function signature, so I'll just 
	// copy the array.
	char mode_cut[BUFLEN + 1];
	strncpy(mode_cut, mode, strlen(mode));
	mode_cut[strlen(mode)] = '\0';
	FILE* (*old_fopen)(const char* filename, const char* mode) = NULL;
	FILE *res;
	handlePathName(filename, buf);
	checkPrintableChars(mode_cut, BUFLEN+1);
	old_fopen = getOrigFuncPtr("fopen64");
	if(old_fopen == NULL){
		perror("fopen");	
		return NULL;
	}
	res = old_fopen(buf, mode);
	fprintf(stderr,"[logger] fopen(\"%s\", \"%s\") = %p\n", buf, mode_cut, res);

	return res;
}
FILE *tmpfile(void)
{
	FILE* (*old_tmpfile)(void) = NULL;
	FILE* res = NULL;
	old_tmpfile = getOrigFuncPtr("tmpfile64");
	res = old_tmpfile();
	fprintf(stderr,"[logger] tmpfile() = %p\n", res);
	return res;
}
ssize_t write(int filedes, const void* buf, size_t n_bytes)
{
	ssize_t (*old_write)(int, const void*, size_t);
	ssize_t res;
	char fdSymlink[PATH_MAX];
	char bufCut[BUFLEN + 1];

	readFdSymlink(filedes, fdSymlink, PATH_MAX);
	strncpy(bufCut, buf, n_bytes);

	old_write = getOrigFuncPtr("write");
	if(old_write == NULL){
		perror("write");	
		return -1;
	}
	res = old_write(filedes, bufCut, n_bytes);
	printf("[logger] write(\"%s\", \"%s\", %zd) = %zd\n", 
					fdSymlink, buf, n_bytes, res);
	return res;
}
size_t fread(void* ptr, size_t size, size_t nmemb, FILE* stream)
{
	size_t (*old_fread)(void*, size_t, size_t, FILE*);
	size_t res;
	char fpName[PATH_MAX];	
	paramFp(stream, fpName, PATH_MAX);
	old_fread = getOrigFuncPtr("fread");
	if(old_fread == NULL){
		perror("fread64");
		return -1;	
	}
	res = old_fread(ptr, size, nmemb, stream);
	printf("[logger] fread(\"%s\", %zu, %zu, \"%s\") = %zu\n",
					ptr, size, nmemb, fpName, res);
	return res;
}
size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE* stream)
{
	size_t (*old_fwrite)(const void*, size_t, size_t, FILE*);
	size_t res;
	char fpName[PATH_MAX];
	paramFp(stream, fpName, PATH_MAX);
	old_fwrite = getOrigFuncPtr("fwrite");
	if(old_fwrite == NULL){
		perror("fwrite");	
		return -1;
	}
	res = old_fwrite(ptr, size, nmemb, stream);	
	printf("[logger] fwrite(\"%s\", %zu, %zu, \"%s\") = %d\n",
					ptr, size, nmemb, fpName, res);
	return res;
}
// TODO: handle the 64-bit open fopen64!
//int open64(const char* path, int oflags, mode_t mode){
//	int (*old_open64)(const char*, int, mode_t);
//	int res;
//	char buf[PATH_MAX];
//	handlePathName(path, buf);	
//	old_open64 = getOrigFuncPtr("open64");		
//	if(old_open64 == NULL){perror("open64");}
//	res = old_open64(path, oflags, mode);
//	printf("[logger] open64(\"%s\", %d, %o) = %d\n", 
//					path, oflags, mode, res );
//	return res;
//}
/*
size_t fread64(void* ptr, size_t size, size_t nmemb, FILE* stream)
{
	size_t (*old_fread64)(void*, size_t, size_t, FILE*);
	size_t res;
	char fpName[PATH_MAX]; 
	paramFp(stream, fpName, PATH_MAX);

	return res;
}
*/
