#### `jobs`
Lists the jobs running in the background, giving the job number. Not as useful as `ps`. It is easy to confuse jobs and processes. Certain builtins, such as `kill`, `disown`, and `wait`, accept a job number or a process number as an argument. The `fg`, `bg`, and `jobs` commands accept only a job number.

#### `disown`
Remove job(s) from the shell's table of active jobs.

#### `fg`, `bg`
The `fg` command switches a job running in the background into the foreground. The `bg` command restarts a suspended job and runs it in the background. If no job number is specified, then the `fg` or `bg` command acts upon the currently running job.

#### `wait`
Suspend script execution until all jobs running in the background have terminated or until the specified job number or process ID terminates. Returns the exit status of the waited-for command. The `wait` command can be used to prevent a script from exiting before a background job finishes executing, avoiding the creation of orphan processes.

#### `logout`
Exit a login shell, optionally specifying an exit status.

#### `suspend`
This has a similar effect to Control-Z but suspends the shell (the shell's parent process should resume it at an appropriate time).

#### `kill`
Forcibly terminate a process by sending it an appropriate terminate signal.

#### `killall`
The `killall` command kills a running process by name, rather than by process ID. If there are multiple instances of a particular command running, using `killall` on that command will terminate all of them.

#### `command`
The `command` directive disables aliases and functions for the command immediately following it.

#### `builtin`
Invoking `builtin BUILTIN_COMMAND` runs the command `BUILTIN_COMMAND` as a shell builtin, temporarily disabling both functions and external system commands with the same name.

#### `run-parts`
The `run-parts` command executes all the scripts in a target directory, sequentially in ASCII-sorted filename order. The scripts need to have execute permission.

```bash
# Run all scripts in the /etc/cron.daily directory
run-parts /etc/cron.daily
```

#### `free`
Shows memory and cache usage in tabular form.

```bash
# Display memory usage
free -h
```

#### `procinfo`
Extracts and lists information and statistics from the `/proc` pseudo-filesystem.

```bash
# Display bootup information
procinfo | grep Bootup
```

#### `lsdev`
Lists installed hardware devices.

```bash
# Show installed hardware
lsdev
```

#### `du`
Shows disk usage, recursively. Defaults to the current working directory.

```bash
# Show disk usage of the current directory
du -h

# Show disk usage of a specified directory
du -h /path/to/directory
```

#### `df`
Shows filesystem usage in tabular form.

```bash
# Show filesystem usage
df -h
```

#### `dmesg`
Lists all system bootup messages to stdout.

```bash
# Show bootup messages
dmesg
```

#### `stat`
Gives detailed and verbose statistics on a given file.

```bash
# Show detailed statistics of a file
stat filename
```

#### `ps`
Lists currently executing processes by owner and PID.

```bash
# Show all processes
ps ax

# Show all processes with extended information
ps aux
```

#### `pgrep`, `pkill`
Combining the `ps` command with `grep` or `kill`.

```bash
# Find processes by name
pgrep processname

# Kill processes by name
pkill processname
```

#### `pstree`
Lists currently executing processes in "tree" format.

```bash
# Show process tree
pstree

# Show process tree with PIDs
pstree -p
```

#### `top`
Continuously updated display of the most CPU-intensive processes.

```bash
# Display top processes
top

# Display top processes in batch mode
top -b
```

#### `nohup`
Keeps a command running even after the user logs off.

```bash
# Run a command that continues after logout
nohup command &

# Run a command and wait to avoid creating orphan or zombie processes
nohup command & wait
```

#### `cron`
Administrative program scheduler.

```bash
# Edit the crontab for the current user
crontab -e

# List the crontab for the current user
crontab -l

# Remove the crontab for the current user
crontab -r

# Run a cron job every minute
* * * * * /path/to/script.sh
```