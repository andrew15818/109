#include  "break.h"
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

struct breakpointTable* table;

struct breakpointTable* breakNewTable(){
    struct breakpointTable* tb = malloc(sizeof(struct breakpointTable));
    tb->head = NULL;
    tb->tail = NULL;
    return tb;
}


struct breakpoint* breakNew(){
    struct breakpoint *bp = malloc(sizeof(struct breakpoint));
    bp->address = 0x0;
    bp->index = 0; 
    bp->next = NULL;
    return bp;
}

int breakAdd(const long int address, const long int orig, struct user_regs_struct old){
	struct breakpoint* bp = breakNew();
	bp->address = address;
    bp->original = orig;
	// save the old regs 
	memcpy(&bp->old, &old, sizeof(bp->old));

	if(table == NULL){table = breakNewTable();}
    if(table->head == NULL && table->tail == NULL){
        bp->index = 0; 
        table->head = table->tail = bp;
		return 1;
    }
    struct breakpoint* tmp = table->tail;
    bp->index = tmp->index + 1;
    tmp->next = bp;
	tmp = bp;
    return 1;
}
int breakDelete(int index){
    // IF table empty
    if(table->head == NULL && table->tail == NULL){
        return 1;
    }
    // IF there is only one node
    if(table->head == table->tail){
        table->head = table->tail = NULL;
        free(table->head);
        return 0;
    }
    struct breakpoint* sent = table->head, *prev;
    int i = 0;
    while(sent->next != NULL && i < index){
        prev = sent;
        sent = sent->next;
        i++;
    }
    prev->next = sent->next;
    free(sent);
    while(prev->next != NULL){
        prev->next->index = prev->index + 1;
        prev = prev->next;
    }
    return 0;
}
/* Debug */
void breakPrint(){
    struct breakpoint* sent = table->head;
    while(sent != NULL){
       printf("b[%ld] = %lx\n", sent->index, sent->address); 
       sent = sent->next;
    }
}
