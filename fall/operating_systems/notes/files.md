# Chapter 13: File System Interface

A **file** is a general-purpose way of storing data on a computer. There are 
different tupes of files because files may be used for different purposes. They are
usually used by the user and Operating System to store some special information.

## File Concept

Along with the file data, we also need to store some data *about* the file, 
such as name, size, type, location, protection, and timestamp information.

## File operations
 Since the file is an *abstract* data type(its behavior is specified rather than its
implementation), we should first define its behavior.

- Creating a file: Some space has to be allocated for the file and an entry has 
to be made in the directory.

- Opening a file: The `open()` system call will return a file handle. To check 
some of the other information for other functionality, we often need access to the 
data.

- Writing a file: We have to specify the file pointer where to write and the information
to place in the file. The write pointer has to keep track of where in the file the 
next piece of information has to be written.

- Reading a file: There are different ways to read the files, but we always need 
to remember where the file pointer is.

- Appending to a file: Inserting content at the beginning or end of a file need not
require I/O access.

The **open file table** is a table kept by the Operating System with information 
about all open files. When a file is referenced, we search the table and return the 
pointer to the file. 

## File Access 
There are different ways of acessing a file:
- **Sequential Access**: Most common way, we read a file from beginning to end, and 
advance the file pointer accordingly as we read the information.
- **Direct Access**: In this way we view the file as a block in itself. In drives, 
there is a random access to any block in the drive. Direct access in files alos 
allows us to have random access to any block in the file. To calculate the number of 
the entry block, we need to know the block length and how many blocks to move in the 
file. This access method could be useful if we were developing a database or other 
file containing different records.

## File Types
Operating systems support naming extensions that provide information about a file
directly from the name. However, not every system supports it. Some OSs add along 
with the filename a `creator` parameter, which indicates the name of the process
that created that file. So when a user clicks on it, the program that created 
the file is again invoked.


## Directory Structure

The directory structure has to support several functions: listing the files, 
creating/deleting/editing/renaming, and traversing the file system. How could we
logically think of the file system?

We firstly need more than one level to the file system. If there were only one level,
the names of different files would probably conflict.

A **two-level directory** offers more functionality since the directories would not
require different names for files in different locations. Each user will have his 
own user file directory (so like `/home/username`?). When the user logs on,
the user is taken to their own directory. Some special mechanism could be provided
so that the user could modify the files of other users. 

What would happen with system files? Say system libraries, compilers, etc... which 
are offered by the OS to all users? The simple solution would be to copy the files
into each user directory, however this would be incredibly wasteful of directory space.
We could complicate the search process slightly by having an extra user directory 
which only contains system files. This way, whenever we call a file to be loaded, 
the operating system could search the local UFD, and if the file is not found, then 
we could search for a group of locations. This group of file locations where we carry 
out a search is called the **path**.

There are several pieces of information kept with each *open* file:
1. **File pointer**: This process-specific file pointer keeps track of the offset
at wihch we were reading the file. Each process has its own, so we keep track of the 
files that each process is accessing in a per-process open file table.
2. **File-open count**: The operating system has to keep track of how many processes
are accessing or closing a file. Once this counter reaches zero, the entry in the 
open file table for that file is removed, since it is finally "closed".
3. **File location**: We keep the location of the open file in memory so that we 
can access it quickly rather than using the directory structure every time.
4. **Access rights**: Not every user has access to each file, so we record the
creator of the file and who can access it.

Directories and files can also be shared among users. In UNIX, these are **links**,
and are implemented as file pointers. The tree directory structure does not allow
files or directories to be shared, however, an **acyclic graph** file structure allows
for files and directories even to be shared among users. What happens when the file
the link points to is deleted? Every time we want to access the link, we have to check
whether it points to a valid file, that is, whether the file it points to can be
**resolved**. There could be a table or list which stores the refreences to a certain
file, and we just search it to see when a file has no other links pointing to it. 

The concern is to avoid the cycles during directory traversal or deletion. One simple
trick(OS designers hate him) is to avoid the links during the file system traversal.
The need for a garbage collection method comes from the possibility of self-referencing.
Thus, even if other files do not reference a particular file (and its reference count is
0), there might still be a link to itself.

## Protection ;)
Providing protection for files in an important function. Protection involves protection
from natrual disruption (natural disasters, power surges, etc...). This is done 
mostly by copying files. The OS could duplicate files to tape or other tertiary storage
at regular intervals.

However, we also want to grant protection from other users. We could either not allow any 
access to other users' files (too extreme) or allow free access (too lenient). 
What we have is permission to do different things to a file.

Another way we can protect the files and directories is by specifying who can do what with a 
certain file. For exapmle, user A could have the read and write permission, but only user B 
could delete the file. We could store the **owner**, **group** of users that can edit the file,
and all the other users in the system. The **access control file** associates a file
or directory with a set of permissions.

In UNIX, there are three bits which indicate the permissions for  file. The `r` bit
specifies read permission, `w` indicates write, and `x` shows execution.

## Memory-Mapped Files
Memory mapping I/O allowed us to treat a I/O as a file access. It involved
assigning an address in the disk to some area of physical memory. We can also 
take this approach with files, and assign each file a page in physical memory. 
(Remember a *page* is the unit in main memory)
