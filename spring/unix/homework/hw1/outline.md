# Hw1 Implementation deets

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
- Executable name of the running process
- Don't show the cmd line args (so no `/proc/<PID>/cmdline`)
I was thinking that we can try and read the `status` file inside each dir
to get the command name.
Or, we could get info about the directory itself and get the command name that way.
Then we would need to loop through the file descriptors right?
If we read the `/proc/<PID>/comm` file, we can directly read the name of the process.
### PID
We can use the name of the directory as the PID.

### User

### FD

### Type

### Node

### Name


## Program Structure
What I'm thinking: 
- in `main()`, we open the `/proc`  and loop through the directories.
- Once we open a dir in `/proc`, e.g. `/proc/1000`, we pass this `DIR*` to another
function that fills in an `lsofEntry*` structure with all the info.
- Each field could have its own function that finds the required info.
