#### `find -exec`
The `find -exec` command carries out `COMMAND` on each file that `find` matches. The command sequence terminates with `;` (the ";" is escaped to ensure the shell passes it to `find` literally, without interpreting it as a special character). If `COMMAND` contains `{}`, `find` substitutes the full path name of the selected file for "{}".

```bash
# Removes all core dump files from user's home directory.
find ~/ -name 'core*' -exec rm {} \;
```

#### `xargs`
`xargs` is a filter for feeding arguments to a command, and also a tool for assembling the commands themselves. It breaks a data stream into small enough chunks for filters and commands to process, acting as a powerful replacement for backquotes. The `-P` option allows running processes in parallel, speeding up execution on a multicore CPU. In situations where command substitution fails with a "too many arguments" error, substituting `xargs` often works. Normally, `xargs` reads from `stdin` or from a pipe, but it can also be given the output of a file. A curly bracket pair serves as a placeholder for replacement text.

#### `expr`
An all-purpose expression evaluator that concatenates and evaluates the arguments according to the operation given. Operations may be arithmetic, comparison, string, or logical. Arguments must be separated by spaces.

#### `date`
Simply invoked, `date` prints the date and time to `stdout`. Its formatting and parsing options make it more interesting.

#### `time`
Outputs verbose timing statistics for executing a command.

#### `at`
The `at` job control command executes a given set of commands at a specified time. It is useful for one-time execution of a command set.

```bash
# Prompts for a set of commands to execute at 2pm on January 15.
at 2pm January 15
```

#### `sort`
A file sort utility, often used as a filter in a pipe. This command sorts a text stream or file forwards or backwards, or according to various keys or character positions. Using the `-m` option, it merges presorted input files.

#### `tsort`
Topological sort that reads in pairs of whitespace-separated strings and sorts according to input patterns. Originally used to sort a list of dependencies for an obsolete version of the `ld` linker.

#### `uniq`
This filter removes duplicate lines from a sorted file. Often used in a pipe coupled with `sort`.

```bash
# Count occurrences of each line in a file.
uniq -c testfile

# Sort and count occurrences, then sort by count.
sort testfile | uniq -c | sort -nr
```

#### `cut`
A tool for extracting fields from files, similar to the `print $N` command set in `awk`, but more limited. Particularly important are the `-d` (delimiter) and `-f` (field specifier) options.

```bash
# Extract specific fields from the output of uname -a.
uname -a | cut -d" " -f1,3,11,12

# Specify a linefeed as a delimiter.
cut -d'
' -f3,7,19 testfile
```

#### `paste`
A tool for merging different files into a single, multi-column file. Useful for creating system log files in combination with `cut`.

#### `join`
A powerful utility for merging two files in a meaningful fashion, creating a simple version of a relational database. It operates on exactly two files, pasting together only those lines with a common tagged field, and writes the result to `stdout`. The files should be sorted according to the tagged field for the matchups to work properly.

```bash
# Join on specific fields of two files.
join -1 FIELD -2 FIELD file1 file2
```

#### `head`
Lists the beginning of a file to `stdout`. The default is 10 lines, but a different number can be specified.

#### `tail`
Lists the end of a file to `stdout`. The default is 10 lines, but this can be changed with the `-n` option. Commonly used to keep track of changes to a system logfile using the `-f` option, which outputs lines appended to the file.

```bash
# List the 8th line of a file.
head -n 8 database.txt | tail -n 1
```

#### `grep`
A multi-purpose file search tool that uses Regular Expressions. It was originally a command/filter in the venerable `ed` line editor: `g/re/p` -- global - regular expression - print.

```bash
# Search for a pattern in files.
grep pattern [file...]

# Force grep to show the filename when searching only one target file.
grep pattern file /dev/null
```

`egrep` (extended grep) is the same as `grep -E`, allowing the boolean `|` (or) operator. `fgrep` (fast grep) is the same as `grep -F`, doing a literal string search.

#### `sed`
A non-interactive "stream editor" that permits using many `ex` commands in batch mode. It finds many uses in shell scripts.

#### `awk`
A programmable file extractor and formatter, good for manipulating and/or extracting fields (columns) in structured text files. Its syntax is similar to C.

#### `wc`
`wc` gives a "word count" on a file or I/O stream.

#### `tr`
A character translation filter that must use quoting and/or brackets as appropriate. Quotes prevent the shell from reinterpreting the special characters in `tr` command sequences. Brackets should be quoted to prevent expansion by the shell.

```bash
# Change all uppercase letters in a file to asterisks.
tr "A-Z" "*" < filename

# Alternatively, using POSIX character classes.
tr "A-Z" '[**]' < filename
```


#### `which`
The `which` command gives the full path to "command." This is useful for finding out whether a particular command or utility is installed on the system.

```bash
# Find the path of the ls command
which ls
```

#### `whatis`
The `whatis` command looks up "command" in the whatis database. This is useful for identifying system commands and important configuration files.

```bash
# Get a description of the ls command
whatis ls
```

#### `getfacl`, `setfacl`
These commands retrieve or set the file access control list — the owner, group, and file permissions.

```bash
# Retrieve file access control list
getfacl filename

# Set file access control list
setfacl -m u:user:rw filename
```

#### `readlink`
Disclose the file that a symbolic link points to.

```bash
# Show target of a symbolic link
readlink symlink
```

#### `diff`, `patch`
`diff`: Flexible file comparison utility. It compares the target files line-by-line sequentially.

```bash
# Compare two files
diff file-1 file-2
```

`patch`: Flexible versioning utility. Given a difference file generated by diff, `patch` can upgrade a previous version of a package to a newer version.

```bash
# Apply a patch to a file
patch < patchfile
```

#### `cmp`
The `cmp` command is a simpler version of `diff`. Whereas `diff` reports the differences between two files, `cmp` merely shows at what point they differ.

```bash
# Compare two files
cmp file-1 file-2
```

#### `basename`
Strips the path information from a file name, printing only the file name.

```bash
# Get the base name of a file
basename /path/to/file
```

#### `dirname`
Strips the basename from a filename, printing only the path information.

```bash
# Get the directory name of a file
dirname /path/to/file
```

#### `shred`
Securely erase a file by overwriting it multiple times with random bit patterns before deleting it.

```bash
# Securely delete a file
shred -u filename
```

#### `mktemp`
Create a temporary file with a "unique" filename.

```bash
# Create a temporary file
mktemp
```

#### `more`, `less`
Pagers that display a text file or stream to stdout, one screenful at a time.

```bash
# View a file with more
more filename

# View a file with less
less filename
```

#### `bc`
`bc` is an arbitrary-precision calculator language.

```bash
# Start bc interactive shell
bc
```

#### `tee`
Redirection operator that permits "siphoning off" to a file the output of a command or commands within a pipe, but without affecting the result.

```bash
# Output to file and stdout
command | tee filename
```

#### `xmessage`
This X-based variant of `echo` pops up a message/query window on the desktop.

```bash
# Display a message in a window
xmessage "Hello, world!"
```

#### `mount`
Mount a filesystem, usually on an external device.

```bash
# Mount a filesystem
mount /dev/sdX /mnt
```

#### `umount`
Unmount a currently mounted filesystem.

```bash
# Unmount a filesystem
umount /mnt
```

#### `sync`
Forces an immediate write of all updated data from buffers to hard drive.

```bash
# Synchronize buffers with disk
sync
```

#### `mkswap`
Creates a swap partition or file.

```bash
# Create a swap partition
mkswap /dev/sdX
```

#### `swapon`, `swapoff`
Enable/disable swap partition or file.

```bash
# Enable a swap partition
swapon /dev/sdX

# Disable a swap partition
swapoff /dev/sdX
```

#### `mke2fs`
Create a Linux ext2 filesystem.

```bash
# Create an ext2 filesystem
mke2fs /dev/sdX
```

#### `badblocks`
Checks for bad blocks on a storage device.

```bash
# Check for bad blocks on a device
badblocks /dev/sdX
```

#### `lockfile`
Creates a lock file, a semaphore that controls access to a file, device, or resource.

```bash
# Create a lockfile
lockfile /tmp/lockfile
```

#### `watch`
Run a command repeatedly, at specified time intervals.

```bash
# Run a command every 2 seconds
watch command
```
