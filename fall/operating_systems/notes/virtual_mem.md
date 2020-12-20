# Virtual Memory
This refers to when the program's memory is not all necessarily in main 
memory.

## Demand Paging
This refers to only bringing the pages that we need into the 
memory. Since some code will not be executed often, it might not be the 
most efficient to load the entire program if we don't need all of it.

The main process for entering a new program into the page table occurs when we have
a *page fault*, or when we want to access a page and it is currently not in the
process's address space.

The logical extreme of doing demand paging is that we can start executing a program
with no pages in memory, and immediately fault on the first page call. Demand paging
also requires the page table, so we mmark whether a page is accessible by a certain
process. The *valid-invalid bit* is accessible through every process's frame, and keeps 
track of which frames are acessbile by the operating system.

Our operating system also keeps a list of the free frames that are available for us
to use. When a process needs to expand in memory by requesting another frame, we
take one from that list and assign it to the process, expanding the page table
in the process.

How long does it take to access the memory? It depends on the frequency of the 
memory page faults. If *p* is the probability of frame drops, then we would have
to know the time it takes us to normally access the memory. We could then say 
the **effective access time** is *(1 - p)ma x page fault time*.

The process for executing a page fault is a long one, since we have to notify the 
operating system, we have to check that the page reference was legal (valid-invalid bit),
context switch while the page is being returned. Then we have to context switch back 
again into our application.

## Copy-on-Write
We had just seen how, using demand paging, we could start execution of a process just
by knowing the first page and defaulting on it. However, this might be uneccessary.
When creating a child process, we would copy all the parent's address space for the 
child. However, we can just share the pages between the parent and the child process.
If we set these pages as *copy on write*, then every time either process wants to 
change a page, we can duplicate it for the other process.

Likewise, the `vfork()` system call will create a new child process but it will be
able to edit the parent's pages. These changes will then be visible by the parent.
Since no copying of pages takes, place, this method can be quite efficient.

## Page Replacement
The idea behind page replacement is how we can get rid of pages that are currently in 
memory. For example, if there are no free frames in the system memory, then we can
take out the one that has been used least recently, or the one that was brought in 
a long time ago. We would have to updat ethe page table (and other tables) to indicate
that the page has been removed from memory.

The overall process for replacing a frame is as follows:
1. We find the location of the second page in secondary storage.
2. Find a free frame in memory. If there are none, we select a **victim frame** with the 
help of a page-replacement algorithm. Otherwise if we find a free frame, we directly 
use it.
3. Change the page tables to indicate that we replaced a frame.

Notice that if there were no free frames, we would need to page-out the victim frame
and page-in the replacement frame, which would effectively double the memory access time.
To this end, we place a **dirty bit** in every page. This bit is toggled whenever the 
page is written into while in memory. When we replace the frame, we check if the frame
has been updated since it was brought in, and if it has been we have to write it 
back into secondary storage.

Page replacement is essential to demand paging. The virtual addresses used by the 
CPU no longer need to be mapped directly to physical addresses. The set of virtual
addresses can be much longer than physical memory if we can replace a page 
on demand. When a process wants to access a frame, we can bring it in from secondary 
storage if the page is not in memory. However, the pages that the program requires
need to be in memory.

### Page-Replacement Algorithms
Since bringing in pages from I/O is expensive, requiring possibly hundreds of cycles,
we should design and choose our page-replacement scheme so as to minimize page faults.

### FIFO Page Replacement
We can also keep a queue with the pages that have been brought into memory. This means
that when we have to load a new page into memory, we replace the one next in line at the
queue. This means that we replace the page that was brought in the longest time ago.

**Example**
Suppose we have the sequence of page accesses

\[1, 2, 3, 4, 1, 2, 5, 1, 2, 3, 4, 5\]

then, if we are only allowed to have 4 frames in our queue, the number of page faults 
would vary. Actually, in this example, the numbe of page faults for 4 frames would
be higher than the number of page faults for 3 pages! This is known as **Belady's
anomaly**. Merely increasing the number of pages in our queue does not guarantee a 
lower number of page faults.

There is, however, an *optimal* algorithm, one that faults the least among known 
page-replacement algorithms and does not suffer from Belady's anomaly. This is called
the **OPT** or **MIN** algorithm, and it simply states
	Replace the page that will not be used for the longest period of time.
The problem with implementing this algorithm in practice is similar to the Shortest Job
First CPU scheduling algorithm: we require knowledge of the input string to know 
which frame is the one that will be used the least.

### Least-Recently-Used Page Replacement

This page replacement algorithm will try and replace the page in memory that 
was used the least recently. When we use the one that was used the longest ago,
we are essentially performing the OPT algorithm in reverse. This algorithm is 
usually considered to be pretty good, although to actually implement it might 
require some extra ingenuity. There are usually two ways of implementing 
it:
1. **Counters**: With each page we would associate a time entry so that we could
find pages by the time they were last updated. Also, we would have to add a 
clock register to the CPU so that it could be increased every time we make a 
reference to the page. We would then need a way to search the page table 
according to the time.
2. **Stack**: Here we keep a stack (usually done as a doubly-linked list).
The least-recently used page is then the value kept by the tail-pointer at the 
base of the stack. Thus we choose this value to be removed as the victim frame.

Many systems might not provide the hardware assistance needed to enable 
true LRU replacement. However, most systems will provide a **reference bit**,
where we toggle it on whenever a byte in the page has been referenced.
This tells us that a frame was updated, but we cannot know the order in which 
the pages were updated. These still serve as the base for many of the LRU
replacement algorithms.

Rather than just having a single bit, we can have an entire byte per every 
page in the page table. We have the operating system constantly update the 
reference bit in every page depending on if the bit was used in that time 
period. Once we do that, we shift the bits to the right to indicate that the 
bit was more recently used. If we interpret the bit as an integer, then 
the lowest value will be the one we replace.

A **second chance algorithm** is one where we keep a clock structure. We then
reset the bits' reference bit. In an **enhanced second chance algorithm** we 
consider the referenced and modify bit as an ordered pair, and thus there are
four classes:
1. (0, 0): Neither recently used nor modified, can be replaced without writing
the contents to secondary storage.
2. (0, 1): Not recently used but modified. Not as good as the first since the 
page contents will have to be written out before replacement.
3. (1, 0): Recently referenced but not modified. Don't replace since it will 
probably be replaced soon.
4. (1, 1): Recently used and replaced, so we don't change it either.

## Applications and Page Replacement
Some applications might do better when they implement their own memory management
system. For example, some database programs might do better without using 
the built-in memory management which was designed for general use. Thus some
applications might decide to implement their own memory management and page 
allocation. Such a scheme is called **raw disk**, and it refers to having a 
separate logical partition which bypasses most operating system services. 
Another reason some applications might choose to do this is to prevent I/O 
buffering on the OS side and the application side. 

For large data warehouses, sometimes there needs to be large sequential read 
operations. In such specific situations an allocation scheme such as  MFU 
might perform better than LRU.

# Allocation of Frames

When a process starts executing, according to demand paging, it would generate
a certain amount of page faults at the beginning before all its pages are 
brought into the queue. When the available frames are exhausted, we can use 
a page replacement scheme to choose a victim frame to replace.

Given **m** total frames and **n** processes, how do we choose how many frames
to allocate to each process? The simplest approch might be **equal allocation**
where we recognize that all comrades are equal and all get the exact same 
amount of food, errrr I mean memory. This approach ignores the different needs
of a program, since my toy school programs require less memory than say a window
manager. Thus simple processes might get more frames that they need leading 
to waste.  **Proportional allocation** allows us to devote a certain number of 
frames to the processes that need them. 

Another way to decide wihch processes get frames is based on priority. If a
process has higher priority, it should get more frames. Under a 
**global allocation scheme**, these processes can choose to take a page from
another process with lower priority. This will come at the expense of the lower
priority program's performance, but it might still lead to a higher throughput
in general. A **local allocation scheme**, on the other hand, allows a process
to choose the victim frame only from within its own address space.

## Thrashing

Thrashing refers to a program that spends more time paging than executing.
Thrashing occurs when there are no free frames available and all used frames are
being used frequently. When pages are then being replaced, we will have to 
constantly page in and page out the frames that were just discarded. 

One approach to prevent thrashing is to provide processes with the amount of 
frames that they will need. The operating system might look at the CPU
utilization of a certain process and determine the **locality** of the 
process based on it. The locality is the set of recently used frames.

The **working set model** attempts to model the locality of a certain 
process by keeping a parameter $\delta$ which represents the recently referenced
frames of a process. Then the operating system will try to allocate frames
such that each process can have its own working-set sized set of frames. 

## Page-Fault Frequency

Another way to interpret thrashing is a problem of page faulting. Page faulting 
is high when there is thrashing. This approach tries to set upper and lower 
bounds to the page fault rate. If the program page faults too little, then 
it might have too many frames, and if it faults too much, maybe it lacks frames
that it needs. We can increase or decrease the number of frames a program has
so that its page fault rate is kept within the thresholds.

# Allocating Kernel Memory

Kernel memory is usually chosen from a different set of free frames than 
user programs. This is because the kernel might use data structures of different
size, which may lead to more wasted page space, since they would have to pull 
an entire page when they don't need it. Also, the kernel requires the pages
to be in contiguous memory space, since some hardware devices may interact 
directly with the memory.

## Buddy System

If the kernel requests some pages that are smaller than the default page size, 
we use a buddy system to divide the size of the pages. If we request a 21KB
with a 256KB page size, we divide the size into two equally sized sub pages
and assign them as buddies. We further subdivide these into power-of-2 
laws to the smallest buddy capable of fitting the 21KB data structure.
The buddy system makes it easier to coalesce, or to join the buddies together
into a bigger page size.

Since we have to subdivide a really large box into smaller ones, we might end up
wasting up to half of the provided page size. This leads to huuushe internal 
fragmentation.\footnote{Remember that internal fragmentation refers to 
a large part of the page being wasted.}

## Slab Allocation

Another way we might allocate memory is by allocating several contiguous pages
at once. The cache used for various-sized kernel data structures can be stored 
this way. A slab might hold some instances of kernel objects which can be stored
in the cache of different sizes. This approach reduces the amount of internal
fragmentation because each kernel slab is composed of objects exactly that size. 

# Other considerations

## Prepaging

Using demand paging, we incur a large cost by having the program fault many times 
at the beginning of its execution. One way to try and solve it is by pre-fetching
some of the pages that the program is likely to use. If we have to page out the
program, when we get the program back into execution we can just bring back
the pages in the working set.

## Page Size

The page size is an important decision. There are many pros and cons to choosing
a larger or smaller page size. 

Smaller page sizes might reduce the amount of internal fragmentation, since the 
page sizes will be more divisible. They also reduce locality.

Larger page sizes might be more useful since every program needs to have a 
copy of the page table during execution. A larger page size would require more
time to be brought in from secondary storage, however. There would also be 
less page faults with larger page size.

## TLB Reach
