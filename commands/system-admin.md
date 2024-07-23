#### `users`
Show all logged on users. This is the approximate equivalent of `who -q`.

#### `groups`
Lists the current user and the groups they belong to. This corresponds to the `$GROUPS` internal variable, but gives the group names, rather than the numbers.

#### `chown`, `chgrp`
The `chown` command changes the ownership of a file or files. This command is a useful method that root can use to shift file ownership from one user to another. An ordinary user may not change the ownership of files, not even their own files.

#### `useradd`, `userdel`
The `useradd` administrative command adds a user account to the system and creates a home directory for that particular user, if so specified. The corresponding `userdel` command removes a user account from the system and deletes associated files.

#### `usermod`
Modify a user account. Changes may be made to the password, group membership, expiration date, and other attributes of a given user's account. With this command, a user's password may be locked, which has the effect of disabling the account.

#### `groupmod`
Modify a given group. The group name and/or ID number may be changed using this command.

#### `id`
The `id` command lists the real and effective user IDs and the group IDs of the user associated with the current process. This is the counterpart to the `$UID`, `$EUID`, and `$GROUPS` internal Bash variables.

#### `lid`
The `lid` (list ID) command shows the group(s) that a given user belongs to, or alternately, the users belonging to a given group. May be invoked only by root.

#### `who`
Show all users logged on to the system.

#### `su`
Runs a program or script as a substitute user. `su rjones` starts a shell as user rjones. A naked `su` defaults to root.

#### `passwd`
Sets, changes, or manages a user's password. The `passwd` command can be used in a script, but probably should not be.

#### `ac`
Show users' logged in time, as read from `/var/log/wtmp`. This is one of the GNU accounting utilities.

```bash
# Show total logged in time
ac
# Example output
total
68.08
```

#### `last`
List last logged in users, as read from `/var/log/wtmp`. This command can also show remote logins.

#### `newgrp`
Change user's group ID without logging out. This permits access to the new group's files. Since users may be members of multiple groups simultaneously, this command finds only limited use.

#### `tty`
Echoes the name (filename) of the current user's terminal. Note that each separate xterm window counts as a different terminal.

```bash
# Show the current terminal
tty
# Example output
/dev/pts/1
```

#### `stty`
Shows and/or changes terminal settings. This complex command, used in a script, can control terminal behavior and the way output displays. See the info page, and study it carefully.

Normally, a terminal works in the canonical mode. When a user hits a key, the resulting character does not immediately go to the program actually running in this terminal. A buffer local to the terminal stores keystrokes. When the user hits the ENTER key, this sends all the stored keystrokes to the program running. There is even a basic line editor inside the terminal.

```bash
# Example showing how keystrokes are handled
cat > filexxx
wha<ctl-W>I<ctl-H>foo bar<ctl-U>hello world<ENTER>
<ctl-D>
cat filexxx
# Example output
hello world
wc -c < filexxx
# Example output
12
```

The process controlling the terminal receives only 12 characters (11 alphabetic ones, plus a newline), although the user hit 26 keys. In non-canonical ("raw") mode, every key hit (including special editing keys such as ctl-H) sends a character immediately to the controlling process.

#### `mesg`
Enables or disables write access to the current user's terminal. Disabling access would prevent another user on the network from writing to the terminal.

#### `wall`
This is an acronym for "write all," i.e., sending a message to all users at every terminal logged into the network. It is primarily a system administrator's tool, useful, for example, when warning everyone that the system will shortly go down due to a problem.

```bash
# Send a broadcast message
wall System going down for maintenance in 5 minutes!
```

#### `strace`
System trace: diagnostic and debugging tool for tracing system calls and signals. This command and `ltrace` are useful for diagnosing why a given program or package fails to run, perhaps due to missing libraries or related causes.

#### `lsof`
List open files. This command outputs a detailed table of all currently open files and gives information about their owner, size, the processes associated with them, and more.

#### `ltrace`
Library trace: diagnostic and debugging tool that traces library calls invoked by a given command.

#### `nc`
The `nc` (netcat) utility is a complete toolkit for connecting to and listening to TCP and UDP ports. It is useful as a diagnostic and testing tool and as a component in simple script-based HTTP clients and servers.

#### `logger`
Appends a user-generated message to the system log (`/var/log/messages`). You do not have to be root to invoke `logger`.