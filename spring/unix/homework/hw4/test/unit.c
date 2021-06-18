#include <CUnit/CUnit.h>
#include <CUnit/Automated.h>
#include <CUnit/Console.h>
#include <CUnit/CUError.h>
#include <CUnit/Basic.h>
#include "../cmd.h"
void testAssign(void){
	char* buf[] = {"break", "cont", "delete", "disasm", "dump", "exit", "get", "getregs", "help", "list", "load", "run", "vmmap", "set", "si", "start"};
	int bufnum = 16;
	char* buf_shrt[] = {"b", "c", "d", "x", "q", "g", "h", "l", "r", "s"};
	int shortnum = 10;
	struct command cmd;
	for(int i =0; i < bufnum; i++){
		CU_ASSERT(i == cmdAssignType(&cmd, buf[i]));	
	}
}

int main(){
	CU_pSuite pSuite = NULL;
	if(CUE_SUCCESS != CU_initialize_registry()){
		CU_cleanup_registry();
		return CU_get_error();	
	}

	pSuite = CU_add_suite("Suite_1", NULL, NULL);
	if(NULL == CU_add_test(pSuite, "assigning cmd test", testAssign)){
		CU_cleanup_registry();
		return CU_get_error();	
	}
	CU_basic_set_mode(CU_BRM_VERBOSE);
	CU_basic_run_tests();
	CU_cleanup_registry();
	return CU_get_error();
}
