#ifndef BREAK_H
#define BREAK_H

struct breakpoint{
	long int address;
	long int index;
	struct breakpoint* next;
} ;

struct breakpointTable{
    struct breakpoint* head;
    struct breakpoint* tail;
    int size;
};

extern struct breakpointTable* table;

struct breakpointTable* breakNewTable();
struct breakpoint* breakNew();
int breakAdd(struct breakpoint*);
int breakDelete(int index);
int breakCleanup();

// Debug
void breakPrint();
#endif