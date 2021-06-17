#ifndef ARGS_H
#define ARGS_H

#include <string.h>
#include <stdio.h>
#include <getopt.h>


#define STR_MAX 256
struct args{
	int s;
	int p;
	char script[STR_MAX]; // script to read 
	char prog[STR_MAX];   // program to exec
};
void parseArgs(int , char** , struct args*);

#endif
