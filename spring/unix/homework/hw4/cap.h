#ifndef CAP_H
#define CAP_H
#include<capstone/capstone.h>

extern csh handle;
extern cs_insn insn;
int capInit();
int capDisassemble(long long int , long long int);

#endif