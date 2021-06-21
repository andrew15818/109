#include <capstone/capstone.h>
#include "cap.h"
csh handle;
cs_insn insn;

int capInit(){
    if(cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK){
        printf("** Error opening capstone.\n");
        return 1;
    }
    return 0;
}