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
Most of the bugs remaining are with the program flow, especially regarding the load commands.
Delete breakpoint. I don't think I'm setting the breakpoint correctly.

- [x] break {instruction-address}: add a break point
- [x] cont: continue execution
- [ ] delete {break-point-id}: remove a break point (have to restore old content)
- [ ] disasm addr: disassemble instructions in a file or a memory region
- [ ] dump addr [length]: dump memory content
- [x] exit: terminate the debugger
- [x] get reg: get a single value from a register
- [x] getregs: show registers
- [x] help: show this message
- [x] list: list break points
- [x] load {path/to/a/program}: load a program **buggy**
- [x] run: run the program
- [x] vmmap: show memory layout
- [x] set reg val: get a single value to a register
- [x] si: step into instruction
- [x] start: start the program and stop at the first instruction
