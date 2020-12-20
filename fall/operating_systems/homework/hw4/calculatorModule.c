#include<linux/init.h>
#include<linux/module.h>
#include<linux/moduleparam.h>

#include <linux/string.h>

#define AUTHOR "Andres Ponce 0616110"
MODULE_LICENSE("GPL");
MODULE_AUTHOR(AUTHOR);

static char *kernelModuleName = "calculatorModule";

static int firstParam = -1;
module_param(firstParam, int, 0644);
MODULE_PARM_DESC(firstParam, "First parameter of the operation.");

static int secondParam = -1;
module_param(secondParam, int, 0644);
MODULE_PARM_DESC(secondParam, "Second parameter for the operation.");

static char* operationParam = "notSet";
module_param(operationParam, charp, 0644);
MODULE_PARM_DESC(operationParam, "Operation to perform: 'sum' - addition / 'sub' - subtraction / 'mul' - multiplication");

static long resultParam = -1;
module_param(resultParam, long, 0644);
MODULE_PARM_DESC(resultParam, "Result parameter for the operation.");

static int initialize(void){
	printk(KERN_INFO "\n[%s - %s]==========\n", kernelModuleName, __func__);
	printk(KERN_INFO "[%s - %s] Hello from calculatorModule!\n", kernelModuleName, __func__);

	//INSERT YOUR CODE HERE
	// Perform addition, subtraction or multiplication of firstParam and secondParam
	// depending on the value of the operationParam
	// If operationParam has an invalid value, return 
	if(strcmp(operationParam, "sum") == 0)
	{
		resultParam = firstParam + secondParam;
	}
	else if(strcmp(operationParam, "sub") == 0)
	{
		resultParam = firstParam - secondParam;
	}
	else if(strcmp(operationParam, "mul") == 0)
	{
		resultParam = firstParam * secondParam;
	}
	else{
		resultParam = 0;
	}
	printk(KERN_INFO "[%s - %s] Operation = %s", 
		kernelModuleName, __func__, operationParam);
	printk(KERN_INFO "[%s - %s] First parameter = %d\n",
		kernelModuleName, __func__, firstParam);
	printk(KERN_INFO "[%s - %s] Second parameter = %d\n",
		kernelModuleName, __func__, secondParam);
	printk(KERN_INFO "[%s - %s] Result = %ld\n", kernelModuleName, __func__, resultParam);

	return 0;
}
static void clean_exit(void){
	printk(KERN_INFO "\n[%s - %s] ==========\nl", kernelModuleName, __func__);
	printk(KERN_INFO "[%s - %s] Goodbye from calculatorModule!\n", kernelModuleName, __func__);

	printk(KERN_INFO "[%s - %s] Operation = %s\n", 
		kernelModuleName, __func__, operationParam);
	printk(KERN_INFO "[%s - %s] First parameter = %d\n", 
		kernelModuleName, __func__, firstParam);
	printk(KERN_INFO "[%s - %s] second parameter = %d\n",
		kernelModuleName, __func__, secondParam);
	printk(KERN_INFO "[%s - %s] Result = %ld\n",
		kernelModuleName, __func__, resultParam);
}
module_init(initialize);
module_exit(clean_exit);