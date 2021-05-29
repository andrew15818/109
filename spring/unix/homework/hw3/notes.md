# Homework 3
## What are we even doing?
Without using the standard C library, we want to immitate some system calls.
This means that we want to declare the functions in our C files and actually write their code
in Assembly.
When we link the files, we are only going to link the files in our project.

## libmini.h
In this file we define the error codes, and declare the syscall wrappers as well as the syscalls we need.

## libmini.c
In the class examples, this file mostly just defines the wrapper functions. The `sys_write()` or other actual
system calls might actually be implemented in Assembly. In the class code most of them were just defined
by macros in Assembly, but I'm guessing most of ours will have to be done by hand.


## Syscalls
How do we save the CPU state? Do we just push all the things onto the stack?
1. `setjmp`: Here we set the stage for the `longjmp` by saving the current CPU state. We also have to 
preserve the signal mask, which is not part of the original syscall.  
2. `longjmp`: restore the preserved CPU state and signal mask.
3. `signal, sigaction`: setup the signal handler 
4. `sigprocmask`: block/unblock signal and set the current signal mask.
5. `sigpending`: check if there is any pending signal.
6. `alarm`: setup a timer for the current process 
7. various functions that handle `sigset_t`: `sigemptyset, sigfillset, sigaddset, sigdelset, sigismember`.  

## Concerns:
- How to save the CPU state? Store it in stack or in registers?
- Same for the signal mask. This at least we could do in C with the special data type.
- how to we add a signal type to the handler?
- how could we check the signal type?

## General Purpose Registers
- AX: accumulator, used in arithmetic
- CX: Counter, used in shift and loops
- DX: Data, used in arithmetic and I/O
- BX: Base, used as pointer to data
- SP: stack pointer, point to the top
- BP: Base pointer, points to the base of the stack
- SI: source index, pointer to source in stream
- DI: destination index, used as pointer to destination in stream ops

## Segment Registers
These registers point to different segments of the program.
- SS: stack segment, point to the stack (?)
- CS: code segment, points to the code
- DS: data segment, points to the data 
- FS: extra data pointer
- GS: extra extra data pointer

## EFlags
This register is 32 bits and stores the state of the CPU. 

AH and AL have 8 bits each, since they are the upper and lower half.
The R means the register is 64 bits, E means 32 bits, and no prefix means 16 bits.
