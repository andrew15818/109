# Chapter 14: File System Implementation
There are many different modules or parts to a file system.
The IO module controls the communication between disks and memory.

The file-organization module knows about files and their logical blocks. This module
an also keep track of free space and allocate unused blocks. A **file control block**
or `inode` in ya'boi UNIX keeps the file's metadata. 

Different file systems might use these same components to reduce the amount of 
copied code.

## File System Operations
Each file system will have some structures either per volume(aka drive) or once per
OS. For example, the first couple sectors in a drive corresponds to whether the 
drive contains boot code. The **boot control block** is responsible for this.

The **volume control block** contains info on the contents of the file system
(free inodes and their locations, etc...). This file system has to have a way of
organizing files, such as a table. The **file control block** also contains information
which allows us to map the specific file to a place in the directory structure.

In-memory structures for our file system are responsible for keeping track of open files,
they store the file tables. The file-organizational module allows us to create new 
files directly from our program. If our program would like to create a new file, 
we would have to create a new entry in the **process open file table**, which keeps
track of the open files per process. This would make a new entry in that file table and
allow us to edit the file using a pointer to the entry in the table.

## Directory Implementation
What kinds of algorithms can we choose to read and write files?

### Linear Search 
This method of searching just has all the files in a linear lits. To find, delete, or
replace a file from such a structure would require a search of the entire list.

### Hash Table
The hash table approach uses a linear list mixed with the hash table. Each entry is a 
hashed file entry. We have a file table that has a fixed size, and if there are
conflicting entries, we use chaining to handle collisions. The pro is that this is 
more flexible than a linear list, since we would only need to traverse (most likely)
less elements in case of a collision than in a linear list.

## Allocation Methods
There is then the question of how the files should be allocated on the actual
physical drive. There are a couple opitons: contiguous, linked, and indexed.

### Contiguous Allocation
This straightforward method requires the file to be in contiguous places on the drive.
This method is good because accessing contiguous blocks requires no movement of the 
read-write head (on physical hard drives). However, there is some external fragmentation
that occurs when we use contiguous allocation. External fragmentation results when the 
piece of data we want to store is broken down into various pages rather than on a 
single contiguous area of memory. 

For this scheme to work, we would need to know the size of the file in advance,
which is hard for a file that might grow in size over a long time. If we allocate 
too much space for a file initially, we risk losing lots of space, leading to internal
fragmentation. If a file needs more space, we add an extra piece of memory to it called
an **extent**. We can add a pointer to the first  block of the extent in the previous
extent.

### Linked Allocation
Here we store a file as a linked list of blocks. Each block is a node in a linked list
of blocks. These blocks need not be continuous. This effectively removes external 
fragmentation, since any block in the free blocks list could be used by just updating
the pointers. However, there are some disadvantages: only sequential file access would
effectively be provided, since to get to the *i*th block, we linearly traverse *i* blocks.

The space used for pointers is also a problem. Since we are using say 4 bytes of 
every block for pointers, around 0.78% of our drive could consist of pointers. This would
increase the size of the files to store the same quantity of file data.

A possible solution to this problem is **clustering** of blocks. If we group some blocks
together, then we can decrease the size the pointers take up. However this approach 
would increase internal fragmentation since wasted space on a larger unit (cluster) 
would hurt more than wasted space on a smaller unit (block). 

MS-DOS used the **File Allocation Table** to store information about the file. This would
hold a pointer to the first block of memory associated with the file. However, there
would be increased overhead in reading the FAT and then moving the head to the start of 
the file.

### Indexed Allocation
In this scheme, there is an **index block** per file. There is a storage block per 
each block of the file. The entries in the index block contain pointers to the 
blocks of the source file. This way, we could support direct access since each block
of the file is directly accessible from the index block for that file. However,
for small files the overhead of allocating an entire block of pointers when all of that 
space might not be used does pose a waste problem. The block might be too large so all
the pointers are not used. This makes the impact of this worse than that of linked
allocation.

Determining the size of the index block has important consequences for resource utilization.
We don't want file sizes that are too small since they woule not allow for large files,
but we don't want to waste large blocks. There are a couple of solutions:

1. **Linked Scheme**: Several index blocks linked together might allow us to have
larger files. In each index block, the last word might be `null` if it ends there or 
a pointer to the next block.

2. **Multilevel Index**: Similar to memory hierarchy, this solution proposes a table that
points to another table that points to the file block. Having this memory hierarchy
would allow us to support larger file sizes.

3. **Combined Scheme**: In this scheme, there are say 15 blocks. Maybe only 12
contain pointers to actual file data, the next one, **single indirect** block contains
pointers to a table that contains pointers to file data. **Double** and **triple**
indirect blocks also contain pointers that go two or three levels before reaching 
the actual data.

## Free-Space Management
The **free space list** is usually implemented as a bit-vector, literally a bit string almost.
Checking for free space is quite efficient. We could check one word at a time by checking
if all the bits in a word on the list are 0, in which case all those blocks are allocated and
cannot be used. 

Another approach is to keep all the free blocks in a linked list. This would work reasonably well
since the list is not often traversed, we only need the first one that is free.

For SSDs and NVMe devices, we need to TRIM the contents of the drive periodically, or let the 
device know that we can use certain blocks again for writing.

## Efficiency and Performance
The efficiency of methods such as clustering or preallocating inodes can be significant.
The "last access date" information kept by some systems can also incur on some inefficiency.

### Performance 
File system operations from IO can be quite slow, even on NVM devices. By caching some of the 
file data brought in, we can provide a quicker access if the data is used again. This method,
of caching file data as pages rather than blocks, can provide much quicker access from the 
main memory rather than going through the file system. Caching file system data as pages rather
than blocks is called **unified virtual memory**. This method also performs better since we can
avoid double caching, if we only provide one way of modifying the data on the drive.

## Recovery

There are many ways in which file systems can go wrong. Power outages, system crashes and even user
applications can cause inconsistencies in the data structures used by the file system. There 
might be inconsistencies if the file is modified in the page cache before being written to memory,
a bug in the file system, etc... There are some ways to help with this

### Consistency Checking
Checking whether all the writes to the system have been completed successfully can be done in
some ways. One that is way too long is to check the file system metadata every time we boot. 
A better way is to have a bit set whenever we change the metadata, we set a status bit to indicate
whether the data was written correctly. If the bit is off, then we might infer there was an issue.
`fsck` on UNIX can check for these discrepancies and attempt to fix them.

This can be impossible in some indexed systems since the data blocks have no knowledge of each other,
but could be done on linked systems where we can follow the data blocks. Some NVM devices have
supercapacitors which can provide enough power to finish the transactions in case of power loss,
but this might still not be enough.

### Log-Structured File Systems
 To maintain integrity, we can also keep a record of each transaction that is made. Once a
transaction is completed, it is written to the log and control can be returned to the 
user system calls. The circular buffer design will make the older data at the beginning of the 
buffer be overwritten once the buffer is full. Also, since the writes to the journal are
sequential, they are quite faster than writing to the metadata at random.

Some other approaches to consistency involve adding a checksum to the memory blocks and also
having a sort of linked list of blocks with the transaction data (?).

We can also back up the data, in which case we can use an incremental backup approach.On the 
first day, we make a full backup of the entire system. The next day we only backup the files
that have been changed since the previous day. Each day after that we backup the files
that have been changed since the previous day. The result is that we have multiple snapshots
of each day. In case we delete a file, we can use the prevoius day's backup to restore it.
