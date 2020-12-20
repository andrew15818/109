---
title: "Chapter 11: Storage Management"
author: "Andres Ponce"
---

## Introduction
The operating system often has to interact with mass storage to either write or 
read data stored there. These devices are usually **hard drives** or **solid state**, 
often called **non volatile memory**(NVM).

## Hard Disk Drives
These types of drives used to be the most common, but are slowly disappearing. 
They store information on rotating magnetic platters, which are read by a head
on the device.

There are multiple disks in such a device. Each disk is logically divided into smaller
units called **tracks**, which are just circular paths around the disk. These tracks
are then further subdivided into smaller storage units called **sectors**, which are the
smallest unit of data in a storage unit.

When the drive wants to read or write data, the **disk arm**, which travels through all
the platters (think of stacked CD's with an arm in the middle) will rotate the disks
so that the correct sectors of the correct platter come under the **read write head**.
While measuring drive performance, we talk about the **transfer rate**, which refers
to the time it takes for data to go from the drive to the computer. There is also the 
question of **positioning time**, which measures the time it takes for the drive
head to come directly to the area where the data is stored on the drive. This takes
into account the **seek time**, or the time required to move the disk to the desired
cylinder on the platter.

Thus there are two events we need to wait for when querying a disk:
1. **Positioning time**: The time it takes for the arm to move the arm to the required
cylinder.
1. **Seek time**: The tme required for the correct sector to move under the read/write 
head.

Thus \{latency = positioning time + seek time\}.

## Nonvolatile Memory Devices

The main difference between NVM devices and HDDs
is that the NVM devices are electrical rather than mechanical. They are composed 
of a controller device which can access some flash NAND. Flash storage can act as 
a USB device, or in case that it acts as a separate disk, an SSD. Because of some
limitations of flash storage, these devices can only be written and erased a certain 
number of times before they wear out.

Since erase operations can be expensive and wear down the system, invalid data might 
still be on the system even though it's no longer being used. The **flash translation
layer** keeps track of wihch physical pages in the system are in use and which pages
contain valid data. **Blocks** in an SSD are storage units composed of various pages.
If an SSD has all its pages currently used, an additional write request might have to 
wait until some of the invlaid data has been cleared. There is a space in the drive 
used for **over-provisioning**, in which the system can place this data before writing 
it to an actual block.

Since, as mentioned the devices are sensitive of wear, the device controller might try
to write the data values to areas which have not been written to recently. This is done
so that all areas of the drive wear out at about the same rate, so that future erase
operations happen on blocks that have not been erased as much.

**NonVolatile Memory express**(NVMe) devices bypass the need for a SATA(Serial Advanced 
Technology Attachment) connection by plugging in directly to the system bus rather 
than transmitting all their data through a SATA connector.

## Address Mapping
Computers usually view memory as a giant one dimensional array of sectors. However, 
to translate this into physical memory addresses can vary between disks and NVM devices.
For a hard disk we would need to specify the track and sector number,while for SSDs
a tuple containing the chip, block and page number would be required. This mapping 
can free programmers from dealing with physical addresses which can vary by drive size.
Also it can lead to an easier way of translating between hard disk addresses and 
solid state addresses. The method used by the computer algorithms are called 
**Logical Block Addresses** (LBA). 

# HDD Scheduling

Similar to instruction scheduling on a CPU, there are also ways of getting information 
from the physical drive. Since logical byte addresses are mapped to unknown physical 
addresses in the drive (the physical addresses are not open to the OS), there might
exist different ways of accessing information. The first type of algorithm is **FIFO**,
or **First Come First Serve**. While this algorithm is fair, it does not provide 
the bet performance because the read-write head might have to move across many cylinders 
multiple times. If we could organize the cylinder requests so that the cylinder accesses
are closer together, then we might minimize the overall distance the read-write head 
has to move over the platter.

## SCAN Scheduling

With this scheduling algorithm, the head scans forward and backward along the cylinder
servicing any requests it finds along the way. It will first start at 0, and service
any requests as the head moves forward. Then, when it reaches the end it will service
any requests going back. However, suppose there are many requests that are 
all grouped together, and they happen to be far from the head. In this case, there might
be many requests that are held up when htey could be serviced pretty quickly.

## C-Scan Scheduling

This algorithm is a variation of the SCAN algorithm, except when the head arrives at the 
end of the cylinder, it moves back to the beginning wihtout servicing any requests along
the way. 

# NVM Scheduling

Since these drives do not contain any moving parts, the algorithms used are mostly 
variations of FCFS. However, some techniques might inform the operating system when 
the data is erased from the drive.

## Error Detection and Correction

 There are many ways to detect an error in a bit of data. A classic approach is to use
a partiy bit, which is 1 depending on the number of ones and zeros in a bit string.
Two errors in a message, however, will fool the parity bit scheme. This method
requires a whole extra bit for every byte.

**Cyclic Redundancy Checks** involve the string *s* and a keyword *k* known to the 
sender and receiver. When the string arrives at the receiver, it will divide the 
*s* by *k*. The remainder *r* will be sent to the sender. At the sender, the 
calculation will be repeated to check for correct transmission. This method is also not
foolproof since there are various values when have the same remainder value when 
divided by *k*.

**Error Correction Codes** seek to detect and correct the error whenever they occur.
A way to implement it is to calculate a code when the data is stored. When we read the 
data, we can calculate the code again and measure the result with the one we stored.
If the values differ, then we know that the values have become corrupted at some point.

# Storage Device Management

Before we initialize any drives, they are just a bunch of uninitialized memory cells. 
Each sector in a memory block contains the **header**, **data segment** and **trailer**.
The header and trailer contain information about the segment.

To the operating system, we have to **initialize** a drive. We can create a **partition**
which is a group of blocks and pages. We can separate them into groups and to the 
operating system they will be different drives. The operating system then has to 
place its own data structures on the drive. We have to choose a drive that is labeled
for booting (meaning it has an operating system installed). Once we find that, we can 
mount the file system on this drive.o

## Boot Lock
When we reboot or power on a computer, we bring in the **bootstrap loader** from usually
an NVM location with a fixed address. This simple program then brings in the real
bootloader, which prompts us to choose a device to boot into. On Windows, the 
Master Boot Record is the boot code that is stored in the first page of the drive from 
which we boot. At boot time, the bootstrap loader will read the MBR and start loading
the first page with the actual OS code.

## Bad Blocks
Since drives contain moving parts and the heads float over some gas, they are prone to 
failure. Thus there are going to be **bad blocks** either at the time of manufacturing 
or throughout the lifecycle of the drive. At the time of manufacturing, a table will be
created which lists the bad block. This table will then be updated as needed by the 
operating system.

Because of these bad blocks, our file system might be prompted to redirect the bad block
so that any future attmepts to access it get redirected. Such an approach will get in the 
way of the optimizations used by our disk to access the information. In each drive,
there will be some space set aside, as a spare cylinder or some spare blocks, 
to allow the drive to redirect faulty blocks to that location. **Sector slipping** 
can allow a damaged sector to stay in a nearby position by scooting all the next 
sectors over one. Then, if sector 17 was damaged, we can scoot over all the sectors
adjacent to 17 over by one until the damaged sectot stays in location 18.

# Swap-Space Management

Swap space are some space in memory where we can place some pages whenever we are running
out of memory space or when we want to move memory to the secondary storage. Recently 
swapping and paging have been  merging in definition because virtual memory sees
the secondary storage as an extension of main memory. Remember paging is the bringing
of files in and out of secondary storage to the main memory. Swap storage can be placed
in a drive under a **raw data** partition, which means there is no file system or 
other organizaiton on that partiiton, rather there is just a controller structure 
which allocates and deallocates blocks of memory. This system might result in sub-optimal
storage and even internal fragmentation, but since swap is volatile and the data is 
constantly being moved in and out, the tradeoff is acceptable.

# Storage Attachment
How do we access storage? Some systems might have their secondary storage attached to
the host, over the network, or over the cloud.

## Host-Attached Storage
These types of storage are attached to the host via a physical connection such as USB
FireWire or SATA. For large data centers, some solution such as fiber connections might
provide access to more faraway networks.

## Network-Attached Storage
These systems have their storage somewhere different over a network. The remote 
procedure calls have to be carried through TCP or UDP.

## Cloud Storage
Cloud storage solutions are implemented through API calls.

## RAID Structure
As drives have become larger and cheaper, it has become feasible to have multiple 
drives in one computer. However, to address some potential performance or 
reliability issues, we can use **Redundant Arrays of Inexpensive Disks** or a RAID
configuration of multiple drives.

The idea behind RAID is that as we pool more drives together, the probability that any
drive will fail gets higher. Thus, we introduce **redundancy**, which involves storing
information that we otherwise might not need in order to rebuild information on a 
drive in case of a failure.

Mirroring the drives (having two physical drives per every logical drive) could greatly 
help prevent data loss in case of a drive malfunction. However, if for example a 
natural disaster or power outage causes both drives to malfunction, we got a booboo on
our hands.

## RAID levels
RAID provides a mechanism for **block-level striping** and **parity checking**. In
a collection of *N* drives, we might have the sequence of writes striped across all the 
blocks, maybe block 1 goes to drive 1, block 2 to drive 2, and so on, and block N + 1
stores a parity calculation. The genius in RAID to how it provides reliability is that
we store an entire parity **block**. Thus, suppose a sector goes bad in another drive and
we lose our data. Then, for every bit in the lost block, we can use the bits in the 
parity block and the remaining drives to rebuild whether the missing bit is 0 or 1.

The RAID levels mentioned in the book are :
1. **RAID Level 0**: Here there is no data redundancy, although there is striping. 
The data is striped over *N* drives but there is no parity drive.
2. **RAID Level 1**: This scheme mirrors the content of every drive on another drive 
used solely for redundancy.
3. **RAID Level 4**: Here, we have *N* drives mapped to one or more parity drives. 
The data is striped over *N* drives and the *N + 1* drive holds the parity block 
for the entire sequence. As mentioned, in case of a loss of a drive, the data 
can be reconstructed with the help of the parity block and the remaining blocks on the 
other drives.
4. **RAID Level 5**: With this level, we don't have a single drive containing all the 
parity information, instead we interleave the parity blocks across all drives. However,
parity blocks on a certain drive cannot contain the parity for blocks in the same drive. 
For example, drive 2's parity blocks cannot correspond to the data blocks stored in drive
2, since in case of a data loss both the data and the parity would be lost.
5. **RAID Level 6**: This level used *Q* data as well as parity, so it could accept 
up to more data loss than a regular RAID scheme.
We calculate the *Q* value with some **Galois field math**, which I've never heard of.
6. **Multidimensional RAID 6**: This scheme amplifies RAID 6 by splitting drives into
multiple rows and columns. Then there is a parity and Q drive for every row and two 
drives for every column as well. This allows for multiple drive failures.
7. **RAID leevels 0+1 and 1+0**: These schemes attempt to merge the performance 
and reliability of levels 0 and 1, but they also end up duplicating the contents of 
the drives.

The requirements for the application might dicatate what RAID configuration is used. 
There are several factors to consider, such as the time to repair a drive (RAID 1 chad),
whether the data loss is critical (RAID 0 chad), or whether we need to leverage both 
(RAID 5 FTW).

In order to prevent some of the potential problems with RAID, we could impelement 
a checksum on the blocks and store them in the pointers to those blocks, or **inodes**, 
used by the system.

Independent objects can also be stored independently, for example search queries, 
songs, or other unique object. Since these objects describe themeselves, to retrieve
them we would could use only their contents.
