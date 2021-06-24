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
void capPrintInt(cs_insn* insn){
	char bytes[128] = "";
	for(int i =0; i< insn->size; i++){
		snprintf(&bytes[i*3], 4, "%2.2x ", insn->bytes[i]);
	}
	printf("0x%"PRIx64":%-32s \t%s\t\t%s\n", insn->address, bytes, insn->mnemonic, insn->op_str);	
}
int capDump(long long int address, long long int data){
	//char buf[8];			
	char buf[8];
	memcpy(&buf, &data, PEEKSIZE);
	int count;
	int ret= 0;
	int size = 0;
	cs_insn *insn;;
	if((count = cs_disasm(handle, (uint8_t*)buf, sizeof(buf)-1, address, 0, &insn)) ==  0) {return 0;}//perror("cs_disasm@disasm");}
	ret += count;

	for(int j = 0; j < count; j++){
		//printf( "0x%012llx: %-32s\t%-10s%s\n", insn[j].address, insn[j].bytes);
		capPrintInt(&insn[j]);
		size += insn[j].size;
		continue;
	}
	cs_free(insn, count);
	return count;

}

// Disassemble single instruction
// Print out contents of data array
int capDisassemble(long long int address, long long int data){
	//char buf[8];			
	char buf[8];
	memcpy(&buf, &data, PEEKSIZE);
	int count;
	int ret= 0;
	int size = 0;
	cs_insn *insn;;
	if((count = cs_disasm(handle, (uint8_t*)buf, sizeof(buf)-1, address, 0, &insn)) ==  0) {return 0;}//perror("cs_disasm@disasm");}
	ret += count;
	// convert binary to char and print
	for(int j = 0; j < count; j++){
		capPrintInt(&insn[j]);
		size += insn[j].size;
		continue;
	}
	cs_free(insn, count);
	return count;
}
