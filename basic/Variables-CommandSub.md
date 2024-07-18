## Variable Referencing and Quoting

- **$**  
  Let us carefully distinguish between the name of a variable and its value. If `variable1` is the name of a variable, then `$variable1` is a reference to its value, the data item it contains.

  Enclosing a referenced value in double quotes (`" ... "`) does not interfere with variable substitution. This is called partial quoting, sometimes referred to as "weak quoting." Using single quotes (`' ... '`) causes the variable name to be used literally, and no substitution will take place. This is full quoting, sometimes referred to as "strong quoting."

  Note that `$variable` is actually a simplified form of `${variable}`. In contexts where the `$variable` syntax causes an error, the longer form may work.

```bash
hello="A B C
D"
echo $hello
# A B C D
echo "$hello" # A B C
D
# As we see, echo $hello and echo "$hello"
# =======================================
# Quoting a variable preserves whitespace.
# =======================================
# give different results.
echo
echo '$hello' # $hello
# Variable referencing disabled (escaped) by single quotes,
# which causes the "$" to be interpreted literally.
```

```bash
other_numbers="1 2 3"
# If there is whitespace embedded within a variable,
# then quotes are necessary.
# other_numbers=1 2 3
# Gives an error message.
echo "numbers = $numbers"
```

- **Uninitialized variable**  
  Uninitialized variable has null value (no value at all!).

```bash
uninitialized_variable=
# Declaring, but not initializing it --
# same as setting it to a null value, as above.
echo "uninitialized_variable = $uninitialized_variable"
# It still has a null value.
uninitialized_variable=23
# Set it.
unset uninitialized_variable
# Unset it.
echo "uninitialized_variable = $uninitialized_variable"
# uninitialized_variable =
# It still has a null value.
```

- **An uninitialized variable**  
  An uninitialized variable has no value, however, it evaluates as 0 in an arithmetic operation.

- **=**  
  The assignment operator (no space before and after). Do not confuse this with `=` and `-eq`, which test, rather than assign!

  Unlike many other programming languages, Bash does not segregate its variables by "type." Essentially, Bash variables are character strings, but, depending on context, Bash permits arithmetic operations and comparisons on variables. The determining factor is whether the value of a variable contains only digits.

```bash
b=BB35
let "b += 1"
echo "b = $b"
# BB35 + 1
# b = 1
# Bash sets the "integer value" of a string to 0.
```

- **Local variables**  
  Variables visible only within a code block or function (see also local variables in functions).

- **Environmental variables**  
  Variables that affect the behavior of the shell and user interface.

  A script can export variables only to child processes, that is, only to commands or processes which that particular script initiates. A script invoked from the command-line cannot export variables back to the command-line environment. Child processes cannot export variables back to the parent processes that spawned them.

- **Positional parameters**  
  Arguments passed to the script from the command line: `$0`, `$1`, `$2`, `$3`, and so forth. `$0` is the name of the script itself, `$1` is the first argument, `$2` the second, `$3` the third, and so forth. After `$9`, the arguments must be enclosed in brackets, for example, `${10}`, `${11}`, `${12}`. The special variables `$*` and `$@` denote all the positional parameters.

  The `shift` command reassigns the positional parameters, in effect shifting them to the left one notch. `$1 <--- $2, $2 <--- $3, $3 <--- $4`, etc. The old `$1` disappears, but `$0` (the script name) does not change. If you use a large number of positional parameters to a script, `shift` lets you access those past 10, although bracket notation also permits this.

```bash
# For example:
until [ -z "$1" ]
do
  echo -n "$1 "
  shift 20
  # If less than 20 pos params, then loop never ends!
  # When in doubt, add a sanity check...
  shift 20 || break
done
```
## Typing Variables: `declare` or `typeset`

The `declare` or `typeset` commands can be used to define the properties of variables in Bash. These commands are essentially identical and allow for the specification of variable types and attributes.

### `declare`/`typeset` Options

- **`-r`**: Readonly  
  This option marks a variable as readonly, meaning its value cannot be changed after being set.

  ```bash
  declare -r var1
  # Equivalent to
  readonly var1
  ```

- **`-i`**: Integer  
  This option declares a variable as an integer, making it suitable for arithmetic operations.

  ```bash
  declare -i var2
  ```

- **`-a`**: Array  
  This option declares a variable as an array.

  ```bash
  declare -a var3
  ```

- **`-f`**: Function(s)  
  This option declares a variable as a function.

  ```bash
  declare -f my_function
  ```

- **`-x`**: Export  
  This option marks a variable to be exported outside the environment of the script itself.

  ```bash
  declare -x var4
  ```

  You can also assign a value to the variable while declaring it for export:

  ```bash
  declare -x var5=373
  ```

### Restricting Variable Scope with `declare`

Using the `declare` builtin within a function restricts the scope of the variable to that function. This means the variable will not be accessible outside the function.

#### Example without `declare`

```bash
foo () {
  FOO="bar"
}

bar () {
  foo
  echo $FOO
}

bar
# Output: bar
```

#### Example with `declare`

```bash
foo () {
  declare FOO="bar"
}

bar () {
  foo
  echo $FOO
}

bar
# Output: (prints nothing)
```

In the second example, `FOO` is declared within the `foo` function, so it is not accessible in the `bar` function.

## Internal Variables

- **$BASH**  
  The path to the Bash binary itself.

- **$BASH_ENV**  
  An environmental variable pointing to a Bash startup file to be read when a script is invoked.

- **$BASH_SUBSHELL**  
  A variable indicating the subshell level.

- **$BASHPID**  
  Process ID of the current instance of Bash. This is not the same as the `$$` variable, but it often gives the same result.
  ```shell
( echo "\$\$ inside of subshell = $$"  # 9602
echo "\$BASH_SUBSHELL inside of subshell = $BASH_SUBSHELL"  # 1
echo "\$BASHPID inside of subshell = $BASHPID" )  # 9603
# Note that $$ returns PID of parent process.
```

- **$BASH_VERSION**  
  The version of Bash installed on the system.

- **$CDPATH**  
  A colon-separated list of search paths available to the `cd` command, similar in function to the `$PATH` variable for binaries.

- **$DIRSTACK**  
  The top value in the directory stack (affected by `pushd` and `popd`).

- **$EUID**  
  "Effective" user ID number.

- **$HOME**  
  Home directory of the user, usually `/home/username`.

- **$HOSTNAME**  
  The hostname command assigns the system host name at bootup in an init script. However, the `gethostname()` function sets the Bash internal variable `$HOSTNAME`.

- **$HOSTTYPE**  
  Host type. Like `$MACHTYPE`, identifies the system hardware.

- **$IFS**  
  Internal field separator.

- **$LINENO**  
  This variable is the line number of the shell script in which this variable appears. It has significance only within the script in which it appears, and is chiefly useful for debugging purposes.

  ```bash
  # *** BEGIN DEBUG BLOCK ***
  last_cmd_arg=$_ # Save it.
  echo "At line number $LINENO, variable \"v1\" = $v1"
  echo "Last command argument processed = $last_cmd_arg"
  # *** END DEBUG BLOCK ***
  ```

- **$OLDPWD**  
  Old working directory ("OLD-Print-Working-Directory", previous directory you were in).

- **$OSTYPE**  
  Operating system type.

- **$PATH**  
  Path to binaries, usually `/usr/bin/`, `/usr/X11R6/bin/`, `/usr/local/bin`, etc.

- **$PIPESTATUS**  
  Array variable holding exit status(es) of last executed foreground pipe.

  ```bash
  bash$ echo $PIPESTATUS
  0
  bash$ ls -al | bogus_command
  bash: bogus_command: command not found
  bash$ echo ${PIPESTATUS[1]}
  127
  bash$ ls -al | bogus_command
  bash: bogus_command: command not found
  bash$ echo $?
  127
  ```

  The members of the `$PIPESTATUS` array hold the exit status of each respective command executed in a pipe. `$PIPESTATUS[0]` holds the exit status of the first command in the pipe, `$PIPESTATUS[1]` the exit status of the second command, and so on.

- **$PPID**  
  The `$PPID` of a process is the process ID (pid) of its parent process.

- **$PWD**  
  Working directory (directory you are in at the time).

- **$REPLY**  
  The default value when a variable is not supplied to `read`. Also applicable to select menus, but only supplies the item number of the variable chosen, not the value of the variable itself.

  ```bash
  echo
  echo -n "What is your favorite vegetable? "
  read
  echo "Your favorite vegetable is $REPLY."
  # REPLY holds the value of last "read" if and only if no variable supplied.
  ```

- **$SECONDS**  
  The number of seconds the script has been running.

- **$TMOUT**  
  If the `$TMOUT` environmental variable is set to a non-zero value time, then the shell prompt will time out after `$time` seconds. This will cause a logout.

- **$UID**  
  User ID number.

- **Additional Environmental Variables**  
  The variables `$ENV`, `$LOGNAME`, `$MAIL`, `$TERM`, `$USER`, and `$USERNAME` are not Bash builtins. These are, however, often set as environmental variables in one of the Bash or login startup files. `$SHELL`, the name of the user's login shell, may be set from `/etc/passwd` or in an "init" script, and it is likewise not a Bash builtin.

- **$#**  
  Number of command-line arguments or positional parameters.

- **$***  
  All of the positional parameters, seen as a single word. `"$*"` must be quoted.

- **$@**  
  Same as `$*`, but each parameter is a quoted string, that is, the parameters are passed on intact, without interpretation or expansion. This means, among other things, that each parameter in the argument list is seen as a separate word.

- **$-**  
  Flags passed to script (using `set`).

- **$!**  
  PID (process ID) of last job run in background.

- **$_**  
  Special variable set to final argument of previous command executed.

- **$?**  
  Exit status of a command, function, or the script itself.

- **`$$`**  
  Process ID (PID) of the script itself. The `$$` variable often finds use in scripts to construct "unique" temp file names.


# Command Substitution in Bash

Command substitution reassigns the output of a command (or multiple commands) into another context. It effectively inserts the command output into a new location.

## Classic Form: Backquotes
The classic form of command substitution uses backquotes (`` `...` ``). Commands within backquotes generate command-line text.

### Example
```bash
command_output=`echo Hello, World!`
echo $command_output # Outputs: Hello, World!
```

### Command Substitution Characteristics
- Invokes a subshell.
- May result in word splitting.

### Word Splitting Example
```bash
COMMAND `echo a b`  # 2 args: a and b
COMMAND "`echo a b`"  # 1 arg: "a b"
COMMAND `echo`  # no arg
COMMAND "`echo`"  # one empty arg
```

### Handling Newlines
Using `echo` to output an unquoted variable set with command substitution removes trailing newline characters, which can cause unexpected results.

```bash
dir_listing=`ls -l`
echo $dir_listing
# Outputs a single line

echo "$dir_listing"
# Outputs multiple lines, preserving newlines
```

### Variable Assignment with Command Substitution
```bash
variable1=`for i in 1 2 3 4 5
do
  echo -n "$i"
done`
echo "variable1 = $variable1"  # Outputs: variable1 = 12345

i=0
variable2=`while [ "$i" -lt 10 ]
do
  echo -n "$i"
  let "i += 1"
done`
echo "variable2 = $variable2"  # Outputs: variable2 = 0123456789
```

## Modern Form: `$()`
The `$(...)` form has superseded backticks for command substitution.

### Example
```bash
output=$(sed -n /"$1"/p $file)
```

### File Contents Example
```bash
File_contents1=$(cat $file1)
File_contents2=$(<$file2)  # Bash permits this as well
```

### Handling Backslashes
The `$(...)` form treats a double backslash differently than backquotes.

```bash
echo `echo \\`  # Outputs: \
echo $(echo \\)  # Outputs: \
```

### Nesting Command Substitution
The `$(...)` form permits nesting, which is not possible with backquotes.

```bash
word_count=$(wc -w $(echo * | awk '{print $8}'))
```

Command substitution is a powerful feature in Bash that allows the output of commands to be used as input in other contexts, enhancing script functionality and flexibility.