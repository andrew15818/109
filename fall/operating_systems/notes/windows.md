# Windows 10
## History
Windows has been around for around 20+ years. The most recent version, Windows 10, 
introduced new features such as C++ support on its *shudders* Visual Studio product.
With every new edition, some improvements have been made to the graphical components
such as windowing system and the graphics library (DirectX), which allows for
general computing on the GPU.

## Design Principles
Security was one of the big design principles in windows 10. For example, multiple
permission levels and encryption of entire drives make it harder for attackers
to gain access to sensitive user information.

Pages of memory can also be marked as to not be executable. Buffer overflows 
are made harder since the contents of the buffer that are malicious cannot 
be executed.

There is also ASLR, which randomizes the memory locations of executable kernel 
code. This functionality also exists in Linux. This has resulted in crimeware 
attacks becoming more prevalent.

Binaries can also be digitally signed by an enterprise to ensure that it's that
enterprise's code that is actually running.

### Reliability
Since billions of machines run Windows, much emphasis is placed on the correctness of the 
code. Microsoft will sample the machines running the Operating System to check their
performance.

### Compatibility 
Windows 10 provides several layers of compatibility to allow software compiled
for earlier versions of Windows to run, even emulating some of the bugs that it
possesed on earlier systems. WSL can also run native Linux binaries without 
recompilation, although the Linux kernel is not there and device drivers cannot load.

### Performance
Since Windows is also run on a large variety of systems, it has to be optimized for 
speed. Some of the things that it does is kernel graphics processing, priority-based
premptive scheeduling.

### Extensible
Windows has a layered architecture which allows it to comfortably load and unload 
some lower-level components at will, such as device drivers. 

### Portable
Since only the Hardware Abstraction Layer of the kernel interacts in a system
dependent way, only that component needs to be changed when Windows is ported to 
another ISA. However, currently there is mostly just AMD64(64-bit x86).

### International Support
It provides dlls and services to convert to other languages and local currencies. 
It uses its own format for characters other than UTF8.

### Power efficiency
Basically, Windows systems will power down many CPUs that are not currently under heavy
use.

### Device Support
Device drivers can also be found and loaded as devices are plugged in without 
uesr intervention.

##  System Components
Essentially, the OS works with multiple layers of software, and there are two layers 
of execution: **Normal World** and **Secure World**. Each of them has its own
user and kernel modes.

### Huper-V Hypervisor
This is a software component for running virtual machines.

### Secure Kernel
The secure kernel provides some of the kernel functionality for user applications,
but is not involved in sensitive functions, as these are still delegated to the user.

### HAL
This portion handles memory interaction and other architecture-dependent details.

The **dispatcher** is in charge of instruction scheduling, context switching, and 
cannot be pre-empted. 

When dealing with multiple threads, there are two instances, **user threads** and 
**kernel threads**. The difference is that when the UT makes a trap to the kernel,
it switches to the KT mode, and when returning to the UT, it will again signal 
a return. There are multiple states of execution for Windows threads. There are 
also multiple priority levels that have to be balanced around.

In Windows, the Timestamp Counter keeps track of the time that the process has been 
executing for.

**Dispatcher objects** handle differen types of synchronization requests, such as 
events, mutex locks, semaphores, threads, and timers. The dispatcher system also 
allows for exception handling and traps. **Traps** are hardware-level exceptions.
User-level programs, when debugging,  can also be assigned a port to receive some 
exception information from the kernel in case of a trap. However if the WER cannot
find an error handler, there's not much it can do.


The **executive** provides a set of services that all subsystems in Windows use. It 
can provide up to two dozen services. For object management, the executive
will create some handle rather than a pointer to  a certain area of the drive.

The `parse()` object function will create an object that overrides the executive naming
convention. The **memory manager** is responsible for allocating the frames in memory, 
which can be of different sizes. The kernel code is also inside the process's address
space, which in case of a system call speeds up the context switch. A **no-access page**
cannot be written to, and is used to determine wheteher a process has overwritten
its allocated 
