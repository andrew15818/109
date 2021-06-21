#include <capstone/capstone.h>
#include <sys/ptrace.h>
#include <string.h>

#include "cap.h"
csh handle;
cs_insn insn;

#define PEEKSIZE 8

int capInit(){
    if(cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK){
        printf("** Error opening capstone.\n");
        return 1;
    }
    return 0;
}

// Disassemble single instruction
int capDisassemble(long long int address, long long int data){
	//char buf[8];			
	char buf[8];
	memcpy(&buf, &data, PEEKSIZE);
	int count;
	cs_insn *insn;;
	if((count = cs_disasm(handle, (uint8_t*)buf, sizeof(buf)-1, address, 0, &insn)) ==  0) {return 0;}//perror("cs_disasm@disasm");}
	for(int j = 0; j < count; j++){
		printf("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);	
	}
	cs_free(insn, count);
	return insn->size;
}
