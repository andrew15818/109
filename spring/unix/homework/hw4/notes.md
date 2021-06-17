# Objective
Implement a debugger able to load and run programs, step, write to memory, etc...
The program also has to support running external scripts if given the -s option.
	- How to implement this?

## Structure
- Process args first (write function that gets parses cmds from script)
- The program has to have a main loop where we take in commands.
	- Maybe have a function that checks whether we take cmd from script or stdin
- print the prompt and take in a command.
	- Check if cmd is valid or we should exit?
- have a way of storing the string of commands and processing it.
- dispatch to the functions responsible for processing each operation.


## PTRACE
`ptrace` and `capstone` are going to be the primary tools for the job. The 
former allows us  to go line by line, and will be what we use for the rest
of the commands.

`capstone` is a dissasembly engine.

## args
- The executable can be run directly such as `./sdb` and then load it.
- One of the args can also be the name of the program to debug `./sdb /path/to/program`
- The `-s` arg will load and run the instructions from a script.



## TODO: 
1. Actually get the ptrace and the capstone up and running 
for teh various commands.
2. Complete the code for the breakpoints linked list.
3. Init the ptrace and the child process **only when the run/start 
command is run**.