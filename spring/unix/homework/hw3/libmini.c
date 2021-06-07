#include "libmini.h"

long errno;
#define	WRAPPER_RETval(type)	errno = 0; if(ret < 0) { errno = -ret; return -1; } return ((type) ret);
#define	WRAPPER_RETptr(type)	errno = 0; if(ret < 0) { errno = -ret; return NULL; } return ((type) ret);

unsigned int alarm(unsigned int seconds){
	unsigned int ret = sys_alarm(seconds);
	WRAPPER_RETval(unsigned int);
}

// restore function for sigaction
void sa_restorer();
__asm__("sa_restorer:\n mov $15, %rax\n syscall");


// This function is mostly a wrapper to a rt_sigaction call
__sighandler_t signal(int signum, __sighandler_t handler){
	struct sigaction act, oact;
	act.sa_handler = handler;
	sigemptyset(&act.sa_mask);
	//act.sa_flags |= signum;
	long ret = sigaction(signum, &act, &oact);
	// Error in setting signal
	if(ret < 0){
		return -1;	
	}
	//return the old disposition of signal
	ret = (long)oact.sa_handler;
	WRAPPER_RETptr(__sighandler_t);
}
// restore values in env to registers
__attribute__((noinline, noclone, optimize(0)))
void longjmp(jmp_buf env, int value){
	
	
	// if val is zero, set to one
	__asm__(
		"mov %rsi, %rax\n"
		"test %rax, %rax\n" //test if value is zero
		"jnz restore\n"
		"inc %rax\n"

		"restore: \n"
		////" 		pop %rdi\n"
		"		mov (%rdi), %rbx\n"
		"		mov 8(%rdi), %rsp\n"
		"		mov 16(%rdi), %rbp\n"
		"		mov 24(%rdi), %r12\n"
		"		mov 32(%rdi), %r13\n"
		"		mov 40(%rdi), %r14\n"
		"		mov 48(%rdi), %r15\n"
		"		jmp *56(%rdi)\n"
	);
	// set env->mask to signal mask
	sigprocmask(SIG_BLOCK, NULL, &env->mask);
}
// need to define this here b/c need to store signal mask
__attribute__((noinline, noclone, returns_twice, optimize(0)))
int setjmp(jmp_buf env){

	__asm__(
		"mov 8(%rbp), %rax\n" // second element of rbp is the return address
		"mov %rbx, (%rdi)\n"
		"mov %rbp, 16(%rdi)\n"
		"mov %rsp, 8(%rdi)\n"	
		"mov %r12, 24(%rdi)\n"
		"mov %r13, 32(%rdi)\n"
		"mov %r14, 40(%rdi)\n"
		"mov %r15, 48(%rdi)\n"
		"mov %rax, 56(%rdi)\n" // return address of caller
	);
	sigprocmask(SIG_UNBLOCK, NULL, &env->mask);
	return 0;
}
long sigaction(int signum, struct sigaction *act, struct sigaction *oldact){		
	// Just set the sigaction 
	struct k_sigaction tmpnew, tmpold;
	long ret = -EINVAL;
	if(act){
		tmpnew.sa_mask = act->sa_mask;
		tmpnew.sa_handler = act->sa_handler;
		tmpnew.sa_flags = act->sa_flags = act->sa_flags | SA_RESTORER;
		tmpnew.sa_restorer = act->sa_restorer = &sa_restorer;
	}
	// To call the sysaction need to implement the kernel data structure
	ret = sys_rt_sigaction(signum, act ? &tmpnew: NULL, oldact ?  &tmpold: NULL, sizeof(sigset_t));

	//return 1;
	if(!ret && oldact){
		oldact->sa_handler = tmpold.sa_handler;
		oldact->sa_mask = tmpold.sa_mask;
		oldact->sa_flags = tmpold.sa_flags;
		oldact->sa_restorer = tmpold.sa_restorer;
	}
	WRAPPER_RETval(long);
}
int sigprocmask(int how, const sigset_t* set, sigset_t* oldset){
	long ret = sys_rt_sigprocmask(how, set, oldset, sizeof(sigset_t));
	WRAPPER_RETval(int);
}
int sigemptyset(sigset_t* set){
	// Check the error condition
	if(*set < 0){
		return -1;	
	}
	 *set = *set & 0;
	return 0;
}
int sigaddset(sigset_t* set, int signum){
	if(*set < 0 || signum < 0 || signum > SIGNUM || set == NULL){
		return -1;	
	}
	// shift left signum-1 times, then or the corresponding bit
	*set |= (1UL << (signum -1));
	return 0;
}
int sigfillset(sigset_t* set){
	if(*set < 0){
		return -1;	
	}
	// ~0 is going to be all ones
	*set |= ~0;
	return 0;
}
int sigdelset(sigset_t* set, int signum){
	if(*set < 0 || signum < 0 || signum > SIGNUM){
		return -1;	
	}
	*set &= ~(1UL << (signum - 1));
	return 0;
}
int sigismember(sigset_t* set, int signum){
	if(*set < 0|| signum < 0 || signum >= SIGNUM){
		return -1;	
	}
	return *(set) & (1UL << (signum -1))?1:0;
}
int sigpending(sigset_t* set){
	long ret = sys_rt_sigpending(set, sizeof(sigset_t));
	WRAPPER_RETval(int);
}
/*

*/
ssize_t	read(int fd, char *buf, size_t count) {
	long ret = sys_read(fd, buf, count);
	WRAPPER_RETval(ssize_t);
}

ssize_t	write(int fd, const void *buf, size_t count) {
	long ret = sys_write(fd, buf, count);
	WRAPPER_RETval(ssize_t);
}

/* open is implemented in assembly, because of variable length arguments */

int	close(unsigned int fd) {
	long ret = sys_close(fd);
	WRAPPER_RETval(int);
}

void *	mmap(void *addr, size_t len, int prot, int flags, int fd, off_t off) {
	long ret = sys_mmap(addr, len, prot, flags, fd, off);
	WRAPPER_RETptr(void *);
}

int	mprotect(void *addr, size_t len, int prot) {
	long ret = sys_mprotect(addr, len, prot);
	WRAPPER_RETval(int);
}

int	munmap(void *addr, size_t len) {
	long ret = sys_munmap(addr, len);
	WRAPPER_RETval(int);
}

int	pipe(int *filedes) {
	long ret = sys_pipe(filedes);
	WRAPPER_RETval(int);
}

int	dup(int filedes) {
	long ret = sys_dup(filedes);
	WRAPPER_RETval(int);
}

int	dup2(int oldfd, int newfd) {
	long ret = sys_dup2(oldfd, newfd);
	WRAPPER_RETval(int);
}

int	pause() {
	long ret = sys_pause();
	WRAPPER_RETval(int);
}

int	nanosleep(struct timespec *rqtp, struct timespec *rmtp) {
	long ret = sys_nanosleep(rqtp, rmtp);
	WRAPPER_RETval(int);
}

pid_t	fork(void) {
	long ret = sys_fork();
	WRAPPER_RETval(pid_t);
}

void	exit(int error_code) {
	sys_exit(error_code);
	/* never returns? */
}

char *	getcwd(char *buf, size_t size) {
	long ret = sys_getcwd(buf, size);
	WRAPPER_RETptr(char *);
}

int	chdir(const char *pathname) {
	long ret = sys_chdir(pathname);
	WRAPPER_RETval(int);
}

int	rename(const char *oldname, const char *newname) {
	long ret = sys_rename(oldname, newname);
	WRAPPER_RETval(int);
}

int	mkdir(const char *pathname, int mode) {
	long ret = sys_mkdir(pathname, mode);
	WRAPPER_RETval(int);
}

int	rmdir(const char *pathname) {
	long ret = sys_rmdir(pathname);
	WRAPPER_RETval(int);
}

int	creat(const char *pathname, int mode) {
	long ret = sys_creat(pathname, mode);
	WRAPPER_RETval(int);
}

int	link(const char *oldname, const char *newname) {
	long ret = sys_link(oldname, newname);
	WRAPPER_RETval(int);
}

int	unlink(const char *pathname) {
	long ret = sys_unlink(pathname);
	WRAPPER_RETval(int);
}

ssize_t	readlink(const char *path, char *buf, size_t bufsz) {
	long ret = sys_readlink(path, buf, bufsz);
	WRAPPER_RETval(ssize_t);
}

int	chmod(const char *filename, mode_t mode) {
	long ret = sys_chmod(filename, mode);
	WRAPPER_RETval(int);
}

int	chown(const char *filename, uid_t user, gid_t group) {
	long ret = sys_chown(filename, user, group);
	WRAPPER_RETval(int);
}

int	umask(int mask) {
	long ret = sys_umask(mask);
	WRAPPER_RETval(int);
}

int	gettimeofday(struct timeval *tv, struct timezone *tz) {
	long ret = sys_gettimeofday(tv, tz);
	WRAPPER_RETval(int);
}

uid_t	getuid() {
	long ret = sys_getuid();
	WRAPPER_RETval(uid_t);
}

gid_t	getgid() {
	long ret = sys_getgid();
	WRAPPER_RETval(uid_t);
}

int	setuid(uid_t uid) {
	long ret = sys_setuid(uid);
	WRAPPER_RETval(int);
}

int	setgid(gid_t gid) {
	long ret = sys_setgid(gid);
	WRAPPER_RETval(int);
}

uid_t	geteuid() {
	long ret = sys_geteuid();
	WRAPPER_RETval(uid_t);
}

gid_t	getegid() {
	long ret = sys_getegid();
	WRAPPER_RETval(uid_t);
}

void bzero(void *s, size_t size) {
	char *ptr = (char *) s;
	while(size-- > 0) *ptr++ = '\0';
}

size_t strlen(const char *s) {
	size_t count = 0;
	while(*s++) count++;
	return count;
}

#define	PERRMSG_MIN	0
#define	PERRMSG_MAX	34

static const char *errmsg[] = {
	"Success",
	"Operation not permitted",
	"No such file or directory",
	"No such process",
	"Interrupted system call",
	"I/O error",
	"No such device or address",
	"Argument list too long",
	"Exec format error",
	"Bad file number",
	"No child processes",
	"Try again",
	"Out of memory",
	"Permission denied",
	"Bad address",
	"Block device required",
	"Device or resource busy",
	"File exists",
	"Cross-device link",
	"No such device",
	"Not a directory",
	"Is a directory",
	"Invalid argument",
	"File table overflow",
	"Too many open files",
	"Not a typewriter",
	"Text file busy",
	"File too large",
	"No space left on device",
	"Illegal seek",
	"Read-only file system",
	"Too many links",
	"Broken pipe",
	"Math argument out of domain of func",
	"Math result not representable"
};

void perror(const char *prefix) {
	const char *unknown = "Unknown";
	long backup = errno;
	if(prefix) {
		write(2, prefix, strlen(prefix));
		write(2, ": ", 2);
	}
	if(errno < PERRMSG_MIN || errno > PERRMSG_MAX) write(2, unknown, strlen(unknown));
	else write(2, errmsg[backup], strlen(errmsg[backup]));
	write(2, "\n", 1);
	return;
}


