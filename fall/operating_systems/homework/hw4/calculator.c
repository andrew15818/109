#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>
#include <fcntl.h>

#define init_module(module_image, len, param_values) syscall(__NR_init_module, module_image, len, param_values)
#define finit_module(fd, param_values, flags) syscall(__NR_finit_module, fd, param_values, flags)
#define delete_module(name, flags) syscall(__NR_delete_module, name, flags)

long addition(int input1, int input2);
long subtraction(int input1, int input2);
long multiplication(int input1, int input2);
// load the module and perform specific operation
int apply_module(const char* params);

void prepare_args(char*, char*, int, int); 
int read_result();
// StudentID = 0616110


int main(){
	char operator;
	char *operation;

	int fd; 		// module file descriptor
	void* image; 	// pointer to module memory
	int input1=0;
	int input2=0;
	long result = 0;

	 while(1)
	 {
	 	input1=0;
	 	input2=0;
	 	result = 0;

	 	printf("==============\n");
	 	printf("Enter operation [sum - sub - mul -exit]: ");
	 	scanf("%s", operation);

	 	if(strcmp(operation, "exit") == 0){
	 		break;
	 	}

	 	printf("Enter two operands(space separated): ");
	 	scanf("%d %d", &input1, &input2);

	 	if(strcmp(operation, "sum") == 0){
	 		result = addition(input1, input2);
	 		printf("Operation [%s] - Operands [%d %d] - Result: [%ld]\n", operation,
	 			input1, input2, result);
	 	}else if(strcmp(operation, "sub") == 0){
	 		result = subtraction(input1, input2);
	 		printf("Operation [%s] - Operands [%d %d] - Result: [%ld]\n", operation,
	 			input1, input2, result);
	 	}else if(strcmp(operation, "mul") == 0){
	 		result = multiplication(input1, input2);
	 		printf("Operation [%s] - Operands [%d %d] - Result: [%ld]\n", operation,
	 			input1, input2, result);
	 	}else{
	 		printf("Invalid option\n");
	 	}
	 }
	 return 0;

}

// join the strings and place them in the buffer
void prepare_args(char* buffer, char*operation, int input1, int input2)
{

	char full_arg[100] ;
	snprintf(full_arg, 100, "operationParam=%s firstParam=%d secondParam=%d", 
		operation, input1, input2);
	strncpy(buffer, full_arg, strlen(full_arg));
}

// After completing the operation, read and return result from param file
int read_result()
{
	const char* pathname = "/sys/module/calculatorModule/parameters/resultParam";
	int result;
	FILE *fp = fopen(pathname, "r");

	if(!fp){
		printf("There was a problem opening the file.\n");
		return 0;
	}

	fscanf(fp, "%d", &result);
	
	return result;
}

// returns the file descriptor, an integer greater than zero
int apply_module(const char* params)
{
	const char* moduleName = "calculatorModule.ko";	
	const char* moduleNameNoExtension = "calculatorModule";	

	size_t image_size;
	struct stat st;
	void *image;

	// Load the module
	int fd = open(moduleName, O_RDONLY);
	printf("Loading module [%s] with parameters [%s]\n", moduleName, params);

	fstat(fd, &st);
	image_size = st.st_size;
	image = malloc(image_size);
	read(fd, image, image_size);

	// Pass the specific parameters to the module
	if(init_module(image, image_size, params) != 0 )
	{
		perror("init_module");
		return EXIT_FAILURE;
	}
	// Read the result from file 
	int result = read_result();
	// Unload the module after running the operation	
	if(delete_module(moduleNameNoExtension, O_NONBLOCK) != 0){
		perror("delete_module");
		return EXIT_FAILURE;
	}	

	close(fd);
	printf("Module is unmounted!\n");
	printf("Cleaning...\n");
	free(image);
	printf("Done.\n");

	return result;
}

long addition(int input1, int input2)
{
	long result = 0;

	//INSERT YOUR CODE HERE TO LOAD/UNLOAD AND USE MODULE
	char args[100];
	prepare_args(args, "sum", input1, input2);
	result = apply_module(args);

	return result;
}
long subtraction(int input1, int input2)
{
	long result = 0;

	//INSERT YOUR CODE HERE TO LOAD/UNLOAD AND USE MODULE
	char args[100];
	prepare_args(args, "sub", input1, input2);
	result = apply_module(args);

	return result;
}
long multiplication(int input1, int input2)
{
	long result = 0;

	//INSERT YOUR CODE HERE TO LOAD/UNLOAD AND USE MODULE
	char args[100];
	prepare_args(args, "mul", input1, input2);
	result = apply_module(args);

	return result;
}