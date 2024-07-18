# Bash Looping Constructs and Conditionals

## For Loop
The basic looping construct in Bash, it iterates over a list of items. Unlike its C counterpart, it uses a `for ... in` syntax.

```bash
for arg in [list]
do
  command(s)...
done
```

### Example
```bash
for file in *
do
  ls -l "$file" # Lists all files in the current directory.
done
```

### Piping Output of a For Loop
```bash
for file in "$(find $directory -type l)" # -type l = symbolic links
do
  echo "$file"
done | sort # Sorts the output
```

### Brace Expansion
```bash
# Bash, version 3+
for a in {1..10}
do
  echo -n "$a "
done
echo
```

### C-like Syntax
```bash
LIMIT=10
for ((a=1; a <= LIMIT ; a++))
do
  echo -n "$a "
done
echo
```

### Increment Two Variables Simultaneously
```bash
for ((a=1, b=1; a <= LIMIT ; a++, b++))
do
  echo -n "$a-$b "
done
echo
```

### Omitting `do` and `done`
```bash
for ((n=1; n<=10; n++))
{
  echo -n "* $n *"
}
```

## While Loop
Tests for a condition at the top of a loop and continues as long as the condition is true.

```bash
while [ condition ]
do
  command(s)...
done
```

### Example
```bash
while (( a <= LIMIT ))
do
  echo -n "$a "
  ((a += 1))
done
```

### Using a Function
```bash
condition ()
{
  ((t++))
  if [ $t -lt 5 ]
  then
    return 0 # true
  else
    return 1 # false
  fi
}
while condition
do
  echo "Still going: t = $t"
done
```

### While Read
Useful for reading and parsing files.

```bash
cat $filename |
while read line
do
  ...
done
```

## Until Loop
Tests for a condition at the top of a loop and continues as long as the condition is false (opposite of `while` loop).

```bash
until [ condition-is-true ]
do
  command(s)...
done
```

## Break and Continue
- `break` terminates the innermost loop.
- `break N` terminates N levels of loop.
- `continue` cuts short the current iteration within its loop and begins the next.
- `continue N` terminates all remaining iterations at its loop level and continues with the next iteration at the loop N levels above.

## Case Statement
The shell scripting analog to `switch` in C/C++. It allows branching to one of several code blocks based on condition tests.

```bash
case "$variable" in
  "$condition1" )
    command...
    ;;
  "$condition2" )
    command...
    ;;
esac
```