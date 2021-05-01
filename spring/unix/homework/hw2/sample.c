#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
int main(){
	int fd = open("README.md", O_RDONLY, 0644);
	chmod("README.md", 0644);
	printf("You got chmoded.\n");
	char buf[100];
	read(fd, buf, 90);
	printf("read done.\n");
	uid_t uid = getuid();
	gid_t gid = getgid();
	chown("README.md",uid, gid);
	printf("You just got chowned.\n");
	
	remove("tmp.txt");
	printf("remove done.\n");
	close(fd);
	printf("closed.\n");
	creat("./hola.txt", O_WRONLY | O_RDONLY );
	rename("hola.txt", "adios.txt");
	return 0;
}
