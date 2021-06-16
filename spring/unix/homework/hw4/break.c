#include  "break.h"
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>

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
    return bp;
}

int breakAdd(struct breakpoint* bp){
    if(table->head == NULL && table->tail == NULL){
        bp->index = 0; 
        table->head = table->tail = bp;
    }
    struct breakpoint* tmp = table->tail;
    bp->index = tmp->index + 1;
    tmp->next = bp;
    return 1;
}
int breakDelete(int index){
    return 0;
}
/* Debug */
void breakPrint(){
    struct breakpoint* sent = table->head;
    while(sent != NULL){
       printf("b[%ld] = %x\n", sent->index, sent->address); 
       sent = sent->next;
    }
}