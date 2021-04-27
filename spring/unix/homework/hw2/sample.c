#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
int main(){
	int fd = open("README.md", O_RDONLY, 0644);
	close(fd);
	return 0;
}
