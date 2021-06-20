#ifndef BREAK_H
#define BREAK_H
#include <sys/user.h>
struct breakpoint{
	long int address;
	long int index;
	struct breakpoint* next;
	struct user_regs_struct old;
} ;

struct breakpointTable{
    struct breakpoint* head;
    struct breakpoint* tail;
    int size;
};

extern struct breakpointTable* table;

struct breakpointTable* breakNewTable();
struct breakpoint* breakNew();
int breakAdd(const long int , struct user_regs_struct);
int breakDelete(int index);
int breakCleanup();

// Debug
void breakPrint();
#endif
