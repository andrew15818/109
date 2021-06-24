#ifndef BREAK_H
#define BREAK_H
#include <sys/user.h>
struct breakpoint{
	long int address;
	long int index;
	long long int original;
	struct breakpoint* next;
	struct user_regs_struct old;
} ;

struct breakpointTable{
    struct breakpoint* head;
    struct breakpoint* tail;
    int size;
};

extern struct breakpointTable* table;
extern int inited ;

struct breakpointTable* breakNewTable();
struct breakpoint* breakNew();
int breakAdd(const long int ,const long int, struct user_regs_struct);
int breakDelete(int index);
int breakCleanup();
int isHandlerRegistered();
int setHandlerInited(int);

// Debug
void breakPrint();
#endif
