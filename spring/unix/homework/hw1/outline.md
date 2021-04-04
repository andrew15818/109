# Hw1 Implementation deets

TODO:
1. Handle the optional regular expressions to filter the output.
2. Get the FD.
3. Get the correct info for type of FD. Remember the info has to be:
- 

We need to work closely with `/proc` to find the details on any process.

For example, we need to see the `proc/<PID>/fd` to see what files the process
has open. We need to make an entry for each of those files.
However, I think that we would need sudo privileges to see these files.

I thought of a new way to structure the program.
We have three structures:
1. `Table`: The table structure basically maintains a pointer to the tail and
head pointer 
2. `Parent`: Each entry in the `/proc/` directory, e.g. `/proc/400/` will be a parent.
3. `Child`: Each file descriptor within each parent directory is an entry in `/proc/<PID>/fd` , 
and we need to print one line for each open file used by another process.

It wouldn't make much sense to have one entry per each file descriptor and then constantly have to copy
the same information over and over again, so to not repeat myself we just make a new structure for the
data we change every time.

The info is arranged as such:
`Table`:
- `tail` pointer to the last parent entry in the table.
- `head` pointer to the first parent entry in the table.

`Parent`:
- `Command` Name of the command in the `/comm` file
- `PID` Should be the name of the subdirectory, otherwise in `/status`
- `User` Should also be in `/status`

`Child`:
- `FD` The file descriptor. 
- `Type` Type of file descriptor
- `Node` Inode
- `Name` filename of the opened file

### Command
- `/proc/<pid>/comm`
The command name is also available in `proc/<pid>/stat`, but it is enclosed in parentheses. So rather than doing string manipulation in c (*shudders*) 
I just read the value from the `/comm` file.

### PID
The PID can be read from the `/proc/<pid>/stat` file as well, but since we already have that name as the name of the directory, I'll just use that one.

### User
- For the user info, I first get the userid by using stat on the process file, and then using 
the getpwuid() function to get the username from the userid. I don't know if there's a better way
since we're supposed to find the **username** not the **userID**.

### FD
I'm still not sure about this one.

### Type

### Node

### Name


## Program Structure
What I'm thinking: 
- in `main()`, we open the `/proc`  and loop through the directories.
- Once we open a dir in `/proc`, e.g. `/proc/1000`, we pass this `DIR*` to another
function that fills in an `lsofEntry*` structure with all the info.
- Each field could have its own function that finds the required info.
