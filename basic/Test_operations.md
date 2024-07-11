## Test Constructs

- **An `if/then` construct tests**  
  whether the exit status of a list of commands is 0 (since 0 means "success" by UNIX convention), and if so, executes one or more commands.
  
- **Dedicated command `[ ]`**  
  There exists a dedicated command called `[` (left bracket special character). It is a synonym for `test`, and a builtin for efficiency reasons. This command considers its arguments as comparison expressions or file tests and returns an exit status corresponding to the result of the comparison (0 for true, 1 for false).

  The `(( ... ))` and `let ...` constructs return an exit status, according to whether the arithmetic expressions they evaluate expand to a non-zero value.

```bash
let "num = (( 0 && 1 ))"
echo $num
# 0
# But ...
let "num = (( 0 && 1 ))"
echo $?
# 1
```

- **An `if` can test any command, not just conditions enclosed within brackets.**

```bash
if cmp a b &> /dev/null # Suppress output.
then
  echo "Files a and b are identical."
else
  echo "Files a and b differ."
fi
```

- **The `[[ ]]` construct**  
  is the more versatile Bash version of `[ ]`. This is the extended test command, adopted from `ksh88`.

  No filename expansion or word splitting takes place between `[[` and `]]`, but there is parameter expansion and command substitution.

```bash
file=/etc/passwd
if [[ -e $file ]]
then
  echo "Password file exists."
fi
```

- **Following an `if`, neither the `test` command nor the test brackets (`[ ]` or `[[ ]]`) are strictly necessary.**

  The `if COMMAND` construct returns the exit status of `COMMAND`.

- **The `(( ))` construct**  
  expands and evaluates an arithmetic expression. If the expression evaluates as zero, it returns an exit status of 1, or "false". A non-zero expression returns an exit status of 0, or "true".

- **Returns true if...**

  - `-e` file exists
  - `-a` file exists  
    This is identical in effect to `-e`. It has been "deprecated," and its use is discouraged.
  - `-f` file is a regular file (not a directory or device file)
  - `-s` file is not zero size
  - `-d` file is a directory
  - `-b` file is a block device
  - `-c` file is a character device
  - `-p` file is a pipe
  - `-h` file is a symbolic link
  - `-S` file is a socket
  - `-t` file (descriptor) is associated with a terminal device  
    This test option may be used to check whether the stdin `[ -t 0 ]` or stdout `[ -t 1 ]` in a given script is a terminal.
  - `-r` file has read permission (for the user running the test)
  - `-w` file has write permission (for the user running the test)
  - `-x` file has execute permission (for the user running the test)
  - `-N` file modified since it was last read
  - `f1 -nt f2` file `f1` is newer than `f2`
  - `f1 -ot f2` file `f1` is older than `f2`
  - `f1 -ef f2` files `f1` and `f2` are hard links to the same file
  - `!` "not" -- reverses the sense of the tests above (returns true if condition absent).

## Integer Comparison

- `-eq` is equal to  
  `if [ "$a" -eq "$b" ]`
- `-ne` is not equal to  
  `if [ "$a" -ne "$b" ]`
- `-gt` is greater than  
  `if [ "$a" -gt "$b" ]`
- `-ge` is greater than or equal to  
  `if [ "$a" -ge "$b" ]`
- `-lt` is less than  
  `if [ "$a" -lt "$b" ]`
- `-le` is less than or equal to  
  `if [ "$a" -le "$b" ]`

### Within Double Parentheses

- `<` is less than  
  `(("$a" < "$b"))`
- `<=` is less than or equal to  
  `(("$a" <= "$b"))`
- `>` is greater than  
  `(("$a" > "$b"))`
- `>=` is greater than or equal to  
  `(("$a" >= "$b"))`

## String Comparison

- `=` is equal to  
  `if [ "$a" = "$b" ]`  
  Note the whitespace framing the `=`.  
  `if [ "$a"="$b" ]` is not equivalent to the above.
- `==` is equal to  
  `if [ "$a" == "$b" ]`  
  This is a synonym for `=`.
- `!=` is not equal to  
  `if [ "$a" != "$b" ]`  
  This operator uses pattern matching within a `[[ ... ]]` construct.
- `<` is less than, in ASCII alphabetical order  
  Note that the `<` needs to be escaped within a `[ ]` construct.
- `>` is greater than, in ASCII alphabetical order  
  `if [[ "$a" > "$b" ]]`  
  `if [ "$a" \> "$b" ]`  
  Note that the `>` needs to be escaped within a `[ ]` construct.

- `-z` string is null, that is, has zero length
- `-n` string is not null.

## Floating Point Arithmetic

- Bash does not understand floating point arithmetic. It treats numbers containing a decimal point as strings.

```bash
a=1.5
let "b = $a + 1.3" # Error.
# t2.sh: let: b = 1.5 + 1.3: syntax error in expression
# (error token is ".5 + 1.3")
echo "b = $b"
# b=1
```

## Comma Operator

- The comma operator chains together two or more arithmetic operations. All the operations are evaluated (with possible side effects).

```bash
let "t1 = ((5 + 3, 7 - 1, 15 - 4))"
echo "t1 = $t1"
# t1 = 11
# Here t1 is set to the result of the last operation. Why?
let "t2 = ((a = 9, 15 / 3))"
echo "t2 = $t2
a = $a"
# Set "a" and calculate "t2".
# t2 = 5
a = 9
```

## The Double-Parentheses Construct

- Like the `let` command, the `(( ... ))` construct permits arithmetic expansion and evaluation. In its simplest form, `a=$(( 5 + 3 ))` would set `a` to `5 + 3`, or `8`. However, this double-parentheses construct is also a mechanism for allowing C-style manipulation of variables in Bash, for example, `(( var++ ))`.
