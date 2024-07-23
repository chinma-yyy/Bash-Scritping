Here is the converted content into Markdown format:

### Essential Bash Commands and Concepts

#### `echo`
The `echo` command prints (to `stdout`) an expression or variable. Be aware that `` `command` `` deletes any linefeeds that the output of the command generates.

```bash
echo `ls -l /usr/share/apps/kjezz/sounds`
# Output: total 40 -rw-r--r-- 1 root root 716 Nov 7 2000 reflect.au -rw-r--r-- 1 root root ...
```

#### `read`
The `read` command "reads" the value of a variable from `stdin`, i.e., it interactively fetches input from the keyboard. The `-a` option lets `read` get array variables. A `read` without an associated variable assigns its input to the dedicated variable `$REPLY`.

```bash
# Read a keypress without hitting ENTER.
read -s -n1 -p "Hit a key " keypress
echo; echo "Keypress was \"$keypress\"."
# -s option means do not echo input.
# -n N option means accept only N characters of input.
# -p option means echo the following prompt before reading input.

# Read user information from /etc/passwd
echo "List of all users:"
while IFS=: read name passwd uid gid fullname ignore
do
    echo "$name ($fullname)"
done </etc/passwd
echo
echo "\$IFS still $IFS"
```

#### `cd`
The `cd` (change directory) command is used in scripts where execution of a command requires being in a specified directory.

- `cd -` changes to `$OLDPWD`, the previous working directory.

#### `pwd`
The `pwd` (Print Working Directory) command outputs the user's (or script's) current directory.

#### `pushd`, `popd`, `dirs`
This command set is a mechanism for bookmarking working directories, allowing orderly navigation.

- `pushd dir-name` pushes the path onto the directory stack and changes to it.
- `popd` removes the top directory from the stack and changes to the next directory.
- `dirs` lists the contents of the directory stack.

#### `eval`
The `eval` command combines and evaluates its arguments, effectively converting a string into a command.

```bash
version=3.4
eval major=${version/./;minor=}
# Replaces '.' in version with ';minor='
# The substitution yields '3; minor=4'
# So eval does minor=4, major=3
```

#### `set`
The `set` command changes the value of internal script variables/options.

- Using `set --` assigns the contents of a variable to the positional parameters.
- If no variable follows `--`, it unsets the positional parameters.

#### `unset`
The `unset` command deletes a shell variable, effectively setting it to null.

#### `export`
The `export` command makes variables available to all child processes of the running script or shell.

#### `declare`, `readonly`
- `declare` and `typeset` specify and restrict properties of variables.
- `readonly` sets a variable as read-only (constant). Attempts to change it will fail.

#### `getopts`
The `getopts` command parses command-line arguments passed to the script, similar to `getopt`.

#### `source`, `.`
The `source` (or dot `.`) command executes a script or loads code into the current script.

#### `exit`
The `exit` command unconditionally terminates a script. It may optionally take an integer argument as the exit status.

```bash
exit 0
# Indicates a successful run.
```

#### `exec`
The `exec` command replaces the current process with a specified command.

```bash
#!/bin/bash
exec echo "Exiting \"$0\" at line $LINENO."
# The script will not execute any lines after exec.
```

#### `shopt`
The `shopt` command changes shell options on the fly.

#### `caller`
The `caller` command inside a function echoes information about the caller of that function.

#### `type`
The `type` command identifies a command, similar to `which`.

#### `hash`
The `hash` command records the path name of specified commands in the shell hash table.

#### `help`
The `help` command gets a short usage summary of a shell builtin. output preserves newlines.

#### `cat`, `tac`
`cat`, an acronym for concatenate, lists a file to `stdout`. When combined with redirection (`>` or `>>`), it is commonly used to concatenate files.

#### `cp`
This is the file copy command. `cp file1 file2` copies `file1` to `file2`, overwriting `file2` if it already exists.

#### `mv`
This is the file move command. It is equivalent to a combination of `cpfile1 file2` copies `file1` to `file2`, overwriting `file2` if it already exists.

#### `mv`
This is the file move command. It is equivalent to a combination of `cp` and `rm`. It may be used to move multiple files to a directory or even to rename a directory.

#### `rm`
Delete (remove) a file or files. The `-f` option forces the removal of even read-only files and is useful for bypassing user input in a script.

#### `chmod`
Changes the attributes of an existing file or directory.

#### `ln`
Creates links to pre-existing files. A "link" is a reference to a file, an alternate name for it. The `ln` command permits referencing the linked file by more than one name and is a superior alternative to aliasing. The `ln` creates only a reference, a pointer to the file only a few bytes in size.

The `ln` command is most often used with the `-s` symbolic or "soft" link flag. Advantages of using the `-s` flag are that it permits linking across file systems or to directories.

The syntax of the command is a bit tricky. For example: `ln -s oldfile newfile` links the previously existing `oldfile` to the newly created link `newfile`.

#### `uname`
Output system specifications (OS, kernel version, etc.) to stdout. Invoked with the `-a` option, gives verbose system info. The `-s` option shows only the OS type.

```bash
# Output verbose system information
uname -a
# Output only the OS type
uname -s
```

#### `arch`
Show system architecture. Equivalent to `uname -m`.

```bash
# Show system architecture
arch
# Equivalent to
uname -m
```

#### `lastlog`
List the last login time of all system users. This references the `/var/log/lastlog` file.

```bash
# List last login times
lastlog
```