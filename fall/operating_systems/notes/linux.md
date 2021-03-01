# A WHOLE CHAPTER ON LINUX WOOOT
**Linux** began in 1991 as an open source 32-bit operating system that was freely 
distributed. The Linux **kernel** is the program that is always running on the computer, 
and that interacts with the hardware. Linux refers to only the kernel, all the extra software
required for a user experience (package manager, installer, etc...) come as part of a 
Linux **distribution**.

Linux slowly released as a pretty limited operating system. Over the years, many more 
features were added to the main kernel, and now we're at version 4.something.

Through the years, Linux has both borrowed code from other projects and other projects have also
taken code from Linux. The X window system, networking code, and gcc were all taken from 
other software projects. 

In the olden days, one had to compile the necessary packages from `ftp` web sites.
Now, distributions will bundle graphical windowing systems, application installers
and package updaters, along with any software that aids in the installing of 
a Linux system. 

Linux is under the version 2 of the GNU Public License. This means that anybody
can analyze, distribute, or modify the Linux source code, even sell derivatives of it.
However, derivatives of software with GPLv2 cannot be distributed only as a compiled
binary, the source code has to be freely available as well.

## Design Principles
Linux has been designed for speed and performance from the start. It is a flexible 
OS that can run on resource-bound machines and up to supercomputers. However, 
standardizing the behavior of Linux on various distributions remains a challenge.

There are three components of a Linux system:
1. **Kernel**: The kernel maintains all the important abstractions such as virtual 
memory, and it also has a scheduler, device controllers, etc...

2. **System Libraries**: These allow applications to interact with the kernel.
For example, `libc` implements the interface between applications and the 
Linux kernel. System calls are applicated at this level.

3. **System Utilities**: These pieces of software perform individual management
tasks. `Daemons` are some such examples.

The Linux kernel is still monolithic, which means it's all in the same address space,
so that there are no context switches required when different kernel functions are
executed (scheduling, device communciation...).

Since the kernel does not implement the behavior of UNIX exactly, it cannot be 
considered a true UNIX OS. Since the format might be different than UNIX applciations
expect, the difference in execution might be great.

## Kernel Modules
As discussed in a previous chapter, writing kernel modules simplifies the 
part of the operating system code. To add/remove a module, we don't have to 
add the module to the kernel and recompile, we can just load the module directly 
to the kernel without re-compiling.

A curious side effect of the module structure: since Linux comes under GPL, all of its
components have to be also distributed under GPL. However, kernel modules can be 
distributed only as compiled binaries for the user to load. Companies could do this 
instead of releasing all their code for free.

### Module Management
The first part of the kernel loading process involves changing the addresses of the 
module's entry points and kernel references with the addresses from the kernel 
address space. This can be done directly with the C linker. 

The module first asks the kernel for a continous space of memory in the kernel space. 
The kernel provides the address for the space, and the module is loaded verbatim into 
that space. The kernel symbol table is then updated with a link to the module 
symbol table.

There is a communication channel between the kernel and the module established
once the module is loaded. The module requester component can also ask the 
kernel to load some module that has not been loaded yet.

### Driver Registration
The module also needs to inform the kernel what its function is. There are kernel
tables where the functions of each module can be stored. There are different 
types of functionality.

### Conflict Resolution
There are many varieties of modules and hardware devices that require drivers. 
Ensuring that resources are not conflicting, for example that no modules access
the same resource at the same time, is the job of the kernel.  To then allot 
the I/O hardware, the module must make a request to the kernel database so the 
hardware resource must be allocated. 

## Process Management
In UNIX, the call to `fork()` and `exec()` split into two. Recall that forking a new
process creates an entire copy of that process. We also need to keep track 
of the `context` of the process, which consists of: **Process ID** this is the id 
used when making a request to the operating system, and is based on the group of the 
process; **credentials**: the corresponding group and user to which the process belongs;
**personality** required by some system libraries to be compatible with certain versions
of UNIX, **namespace** indicates which part of the file system is visible to the 
process. 

### Process Environment
When a new process is forked, its command line argument and default text variables are
inherited as **argument vector** and **environment vector**. Every forked process will
inherit those from its parent, and they are stored as the first data in the stack.

## Memory Management
Linux splits memory into several regions, although in x86\_64 there are only two: 
`ZONE_DMA` and `ZONE_NORMAL`, for regularly allotted frames. There is both 
memory allocation that is set such as for drivers, and there is dynamic allcoation, 
the kernel structures all use `kmalloc()` rather than `malloc()` but to similar effect.

Linux also uses the buddy system, where multiple pages of memory are broken down 
into the smallest pieces that can satisfy a memroy request. For kernel data structures,
**slabs** are the unit which are composed of various contiugous pages, and are allocated
to kernel structures.

Linux pages single pages rather than taking out entire processes out of memory.

### Executing User Programs
When a program is to be executed on Linux, its pages are mapped to virtual memory from
physical memory by the loader. The files come in ELF format since this binary format
is more flexible. Extra debugger routines can be added wihthout the loader derping out.

Remember that user programs have data and text sections. Not all of these are visible to 
the user always. We can access the data and heap sections, right?

Static and dynamic linking are also possible in Linux. Remember that static linking 
requires system library functions to be included directly in the executable. This 
requires that a copy of those functions exist across various executables, which can 
lead to some wasted space. An alternative is to use dynammic linking, which includes
the libraries whenever they are needed, but the entire library will be included since 
we don't know in advance which section will be included.

## File Systems
There are different object types in a file system: inodes that represent individual 
files; file objects which account for open files, superblok object which are entire
file systems, and dentry objects which represent directory entries. All of these 
have common functions. Operations on directories don't require any files to be 
opened, rather the `inode` object is changed rather than the `file` object.

The ext3 file system, which is used on most Linux distros, attempts to schedule 
related blcoks of data at contiguous locations of memory, so that writing 
can be done in bigger sizes for performance reasons. We can write related data 
together so that there are no disk seeks involved in reading/writing files. For each
group of pages there is also a bitmap indicating which blocks are free.

### Journaling
As we complete tasks, the transaction is recorded into a circular buffer called the 
journal. When the transaction is completed it is removed (?) from the journal.
In the case of a crash, all the items in the journal would need to be handled to 
ensure the consistency of the file system.

## `proc` file system
This distinct file system can show much information on the kernel and active processes
as plain text files.

## Input and Output
Linux follows the UNIX way of showing devices and device drivers as files to the user.
This allows communication with devices through the file system. There are three 
types of devices that Linux recognizes:
1. **Block devices**: These devices are those such as drives and CDs which 
can be written to in fixed-size blocks. 
2. **Character devices**: These are most other devices. The main difference between block
devices and character devices is that block devices are accessed randomly whereas 
character devices are accessed serially (e.g. positions in a file, mice, keyboard, etc...).
3. **Network Devices**: These devices require the kernel networking interface to 
communicate.

Block devices are scheduled according to the **request manager**, and I/O requests
are grouped by process. Then a C-SCAN algoritm will determine which process's requests
are granted in which order.

For character devices, the request from the kernel is almost entirely given to the 
device to handle. Since there are many different types of character devices, the kernel
ain't got no biness tryin' to mess with that device. The exceptions to this rule 
are the devices that are terminal devices, whose input and output are handled and 
interpreted by a **line discipline** before being given to the terminal teletype.

## Interprocess Communciation 
Linux uses **signals** for IPC. When a proces is expecting a signal, the kernel will
place that process in a queue for that specific event. This way, many different processes
can wait for a single event at the same time. 

### Pipin'
Pipes offer communication between processes by offering wait queues for the output
of one program and the input of another program.

## Linux Networking
The networking stack in Linux resembles that of 4.3 BSD. The user will only interact 
with the socket interface, and the kernel is in charge of implementing all the other
networking protocols we know and love. Network packets can be stored in an area of 
memory called the **socket buffer** or `skbuffer`, where the packets can be deconstructed,
checksums calculated, and other functionality done to avoid unneccessary copying of 
the files.

The kernel implements all of the TCP/IP stack. As incoming packets are received, 
an area in their header will identify their destination and what protocol they are 
supposed to be using. The stack can then determine what to do next with the packet,
whether to send the packet on or to forward it to another area within the host.

## Security
The two main types of security offered by Linux are **authentication**, or making 
sure that the user is legit who they say they are, and **access control**, or making
sure that the user has the appropriate permissions to view a certain piece of data.


### Authentication
The OG way of handling authentication in Linux involved storing the password in a
publicly viewable file, and then combining the password with a "salt" value 
and then passing it through a one-way transformation function. When a user entered
the password, this process would be repeated and the input password would be checked
with the stored hashed password to see if it matched. Since then this method has been
changed to one where the authentication modules can be loaded so that if a user changes
the password, it will be seen on all the devices.

### Access Control
Every user in Linux has a unique id (UID) and a group id (GID). Every file will also
have an id that identifies the owner of that file. If the user id matches the file's 
id, then the user is the owner and has *owner rights*. If the user's group id matches
the file's id, then the user has *group rights* to the file.
