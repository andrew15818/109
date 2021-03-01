---
title: "I/O Systems"
author: "Andres Ponce"
---
# Chapter 12: I/O Systems

# Overview
During recent years, there has been a wide variety of I/O devices. These 
are connected to the kernel by kernel modules and device drivers, which
specify a way of communicating with the hardware devices.

# I/O hardware
Even though IO can involve human-computer interfaces, sensors, or 
storage devices, usually there are only a couple ideas to learn in order
to understand communication. Firstly, there is the idea of a **port**, which
is a point of communciation between two machines. Messages arriving at a 
certain port might be forwarded to a certain process to read and not to others.

A **bus** involves physical wires between the connections. If there are 
connections chaining two or more devices, this is called **daisy chaining**.
The common bus structure in a computer is called **PCIe**, which connects the 
memory and processor to other devices such as mass storage, input devices, 
and other interfaces. The PCIe interface consists of **lanes**, which are made 
of two pairs of wires (4 wires in total). One pair receives data and the other 
pair sends data back to the device. Thus, each device might have multiple 
lanes connecting it to the CPU, and different devices require different 
amounts of lanes.

**Controllers** are the electronics that dictate how electronics operate 
and how they are managed. Different sections such as storage disks, memory, 
serial ports, etc... all have controllers. In a dis drive for example, they 
might contain some microcode that implements the microcode for transmitting 
data; in a data cetner the **fibre channel** bus controller might be a very 
complex piece of circuitry requiring its own special add-in  chip module
to controll the flow of data in a data center.

## Memory-Mapped I/O
In yesteryear, the CPU would give I/O isntructions to directly control
I/O. However, now the CPU uses **memory-mapped I/O**. In this scheme the CPU
will write information to the registers assigned to each controller, and will
write the requested address to the register. The graphics controller, for
example, is responsible for writing all the contents of the screen to its 
own memory buffer, wo it is muc quicker to do this an send the screen contents
directly to the screen than it is to issue many IO instructions directly from 
the CPU.

There are four regisers for I/O interaction:
1. **Data-in register**: This is the data read by the host to get input.
2. **Data-out register**: This is the register the host writes to to send output
to the IO device.
3. **Status register**: This register is read by the host to see the status of the
command, for example if it has finished executing or if there has been an error.
4. **Control register**: The bits in this register would specify some 
parameters for how the command is to run, for example to conduct parity checking,
word length, etc...

## Polling

Polling suggests that the host should first check the *busy bit* on the controller
to see if the controller is busy wiht some other instruction. If it is busy,
then we wait. Once we can write a command, we set the *write bit* to indicate 
that the host is writing the data to the *data-out* register. After we are 
done writing the instruction, we set the *command-ready* bit to tell the controller
there is a new command it can run. The *command-ready* bit is cleared and then
the controller executes the command, and the `error` register is cleared to 
indicate that the command succeeded.

Polling can work well, however it requires the CPU to constantly be asking 
and possibly ignoring other important tasks. This is the reason why we instead
use *interrupts*. There is a wire leading from the interrupt vector 
directly to the CPU. After execuitng each instruction, the CPU will check 
whether there has been some activity on that wire. If so, the CPU will perform
a state save on the currently executing process and handle the interrupt.

In modern systems, we need some more sophisticated features, so we use more than
one type of interrupt. The two types of interrupts are **maskable** and 
**nonmaskable**. The former are used when the CPU can delay their handling in
case it is currently executing some sensitive instructions that cannot be 
interrupted. Non maskable interrupts occur when there is a critical error 
such as a memroy error or dividing by zero.

The approach of using a vector to handle the interrupts is split into two 
levels. Level one interrupt handlers handle the context switching and indexing,
while the second level interrupt handler actually carries out the calculation.
User programs will use certain libraries to execute system calls. Among these
are **software interrupts** or **traps**. These instructions receive less
priority than interupts coming from system devices or other, more urgent sources.

## Direct Memory Access

Checking the status bits on a general-purpose CPU woudld be a time-consuming 
process, so there is usually another smaller processor responsible for 
I/O and transfering data to/from memory. The CPU will list the start and 
end pointer for the addresses, and the number of bytes to be written. This 
also allows the CPU to write multiple blocks with a single command.

# Kernel I/O Subsystem
When there are many I/O opertaions, how does our kernel scheule and manage them?
It depends on the call. Scheduling the order of these calls is quite importan,
since the scheduling order might affect the overall system performance. When a program
requests a device, this request is placed in the **wait table queue** for the device, or
it has to go in line for the programs that are requesting the device.

## Buffering
A **buffer** is an area of memory which stores information to be transported somewhere else.
Why buffer? THere is a speed difference between the produer and consumer. For example, 
a network is pretty slow compared to a drive, so in order to write to the memory it would be 
pretty inefficient to write after every bit of data arrives. In order to do it in one operation,
we could write all the data at once when the buffer is full. **Double buffering** is introduced
to take advantage of the write time when a buffer is full and writing to memory. While one buffer
is full and writing to memory, a second buffer continues receiving data from the network/drive.

Buffering and cache are different because caching involves a *copy* of the object being stored
in memory, whereas buffering involves only one copy of the data. **Spooling** refers to keeping
the outputs to a certain output device on a storage file rather than some specific buffer. For 
example, a printer can only accept one stream of data at once, so the operating system will 
buffer the output by storing them in temporary files.

# Translating I/O instructions to hardware instruction
In UNIX, the name of the file maps to an `inode` in the file allocation table.  At boot time,
the kernel will probe the hardware buses and then load the devices. We can load devices
at boot time or dynamically, however dynamically requires more effort. If we make a request
in the system, the operating system checks whether the request can be fulfilled already,
otherwise we make a request to the device driver.

# Streams
A **stream** is a direct connection between a device driver and a user input process. There is 
a pointer to the stream head and a driver end which controls the device that is being used.

# Performance
The performance of IO can involve several context switches, for example in the case of a 
keyboard input. For input being done over a network, for example through `ssh`, the input
is worse becuase every key press has to be sent through the network and unpacked once there.
Every time there is a keypress, there has to be a state save and a context switch because this
is all handled as an interrupt. 

Becuae of this, on mainframes and other high-end systems, there is a dedicated chip in charge of
IO.
