#include "libmini.h"
void printo(){
	write(1, "WE returned!\n", 13);
}
typedef void (*proc_t)();
static jmp_buf jb;
//#define FUNBODY(m, from) {write(1, m, strlen(m)); longjmp(jb, from);}
//
//void a() FUNBODY("This is function a().\n", 1);
//void b() FUNBODY("This is function b().\n", 2);
//void c() FUNBODY("This is function c().\n", 3);
//proc_t funs[] = {a, b, c};
void handler(int s){}

int main(){
	volatile int i = 0;
	if(setjmp(jb) != 0){
		i++;
	}
	if (i < 3){
		char m[] = "Supposed to be jumping back\n";
		write(1, m, sizeof(m));
		longjmp(jb/*, ++i*/);
	} 
	return 0;
	//jmp1.c
	/*
	sigset_t s;
	sigemptyset(&s);
	sigaddset(&s, SIGALRM);
	sigprocmask(SIG_BLOCK, &s, NULL);
	signal(SIGALRM, SIG_IGN);
	signal(SIGINT, handler);
	alarm(1);
	pause();
	if(sigpending(&s) < 0) perror("sigpending");
	if(sigismember(&s, SIGALRM)){
		char m[] = "sigalrm is pending.\n";
		write(1, m, sizeof(m));	
	}else{
		char m[] = "sigalrm is not pending.\n";	
		write(1, m, sizeof(m));
	}
	*/
	/*	
	struct jmp_buf s;
	for(int i =0; i< 8; i++){
		s.reg[i] = 1;	
	}
	s.mask = 2;
	int ret = setjmp(s);
	int a;
	//(ret==0)?write(1, "zero\n", 5):write(1, "not zero\n", 9);
	//longjmp(s, 0);
	
	
	sigset_t s;
	sigsetempty(&s);
	sigaddset(&s, SIGALRM);
	sigprocmask(SIG_BLOCK, &s, NULL);
	alarm(3);
	sleep(5);
	if(sigpending(&s) < 0) perror("sigpending");
	if(sigismember(&s, SIGALRM)){
		char m[] = "sigalrm is pending.\n";
		write(1, m, sizeof(m));
	}else{
		char m[] = "sigalrm is not pending.\n";
		write(1, m, sizeof(m)); 	
	}
	return 0;
	
	struct sigaction a, b;
	a.sa_handler = &printo;
	sigemptyset(&a.sa_mask);
	sigaction(SIGALRM, &a, &b);
	//struct jmp_buf s;
	//setjmp(s);
	//sigset_t hola;
	//sigsetempty(&hola);
	alarm(3);
	pause();
	write(1, "hola\n", 5);
	*/
	/*	
	sigset_t s;
	sigemptyset(&s);
	sigaddset(&s, SIGALRM);
	sigprocmask(SIG_BLOCK, &s, NULL);
	alarm(3);
	sleep(5);
	if(sigpending(&s) < 0) perror("sigpending");
	if(sigismember(&s, SIGALRM)) {
		char m[] = "sigalrm is pending.\n";
		write(1, m, sizeof(m));
	} else {
		char m[] = "sigalrm is not pending.\n";
		write(1, m, sizeof(m));
	}
	*/
	write(1, "In here\n", 8);
	return 0;
}
