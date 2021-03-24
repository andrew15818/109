# Hw1 Implementation deets

We need to work closely with `/proc` to find the details on any process.

For example, we need to see the `proc/<PID>/fd` to see what files the process
has open. We need to make an entry for each of those files.
However, I think that we would need sudo privileges to see these files.

Use the `dirent()` struct to read the entries in a directory.
We need the following fields:
## Command
- Executable name of the running process
- Don't show the cmd line args (so no `/proc/<PID>/cmdline`)
I was thinking that we can try and read the `status` file inside each dir
to get the command name.
Or, we could get info about the directory itself and get the command name that way.
Then we would need to loop through the file descriptors right?
If we read the `/proc/<PID>/comm` file, we can directly read the name of the process.
## PID
We can use the name of the directory as the PID.

## UserM

## FD

## Type

## Node

## Name
