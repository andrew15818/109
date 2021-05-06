#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <string.h>
int main(){
	
	int res = creat("./tmp.txt", O_WRONLY|O_RDONLY);		
	chmod("tmp.txt", O_WRONLY );

	gid_t gid = getgid();
	uid_t uid = getuid();
	chown("tmp.txt", uid, gid);
	rename("tmp.txt", "hola.txt");
	int fd = open("hola.txt", 1101, 438);
	write(fd,"wwww", 4);
	close(fd);
	fd = open("hola.txt", 000, 000);
	FILE* fp = tmpfile();
	fwrite("Hellow!", 1, 7, fp);
	write(fd, "hola", 4);
	remove("hola.txt");
	fclose(fp);
	return 0;
}
