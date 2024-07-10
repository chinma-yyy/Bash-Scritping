## Comments
Lines beginning with a `#` (with the exception of `#!`) are comments and will not be executed.
```bash
# This line is a comment.
```

## Command separator [semicolon]
Permits putting two or more commands on the same line.
```bash
echo hello; echo there
```

## Terminator in a case option [double semicolon]
```bash
case "$variable" in
abc) echo "\$variable = abc" ;;
xyz) echo "\$variable = xyz" ;;
esac
```

## Comma operator
The comma operator links together a series of arithmetic operations. All are evaluated, but only the last one is returned.
```bash
let "t2 = ((a = 9, 15 / 3))"
# Set "a = 9" and "t2 = 15 / 3"
```

## Escape [backslash]
A quoting mechanism for single characters.
```bash
\
```

## Command substitution
The `command` construct makes available the output of command for assignment to a variable. This is also known as backquotes or backticks.
```bash
`command`
```

## Null command [colon]
This is the shell equivalent of a "NOP" (no op, a do-nothing operation). It may be considered a synonym for the shell builtin true. The ":" command is itself a Bash builtin, and its exit status is true (0).
```bash
:
```

## Test operator
Within certain expressions, the `?` indicates a test for a condition. In a double-parentheses construct, the `?` can serve as an element of a C-style trinary operator.
```bash
condition?result-if-true:result-if-false
```

## Quoted string expansion
This construct expands single or multiple escaped octal or hex values into ASCII or Unicode characters.
```bash
$' ... '
```

## Process ID variable
The `$$` variable holds the process ID of the script in which it appears.
```bash
$$
```

## Redirection
```bash
> &> >& >> < <>
```
- `scriptname >filename` redirects the output of `scriptname` to file `filename`. Overwrites `filename` if it already exists.
- `command &>filename` redirects both the `stdout` and the `stderr` of `command` to `filename`.
- `command >&2` redirects `stdout` of `command` to `stderr`.
- `scriptname >>filename` appends the output of `scriptname` to file `filename`. If `filename` does not already exist, it is created.
- `[i]<>filename` opens file `filename` for reading and writing, and assigns file descriptor `i` to it. If `filename` does not exist, it is created.

## Redirection in a here document
```bash
<<
```

## Redirection in a here string
```bash
<<<
```

## Run job in background
A command followed by an `&` will run in the background.
```bash
&
```

## Previous working directory
A `cd -` command changes to the previous working directory. This uses the `$OLDPWD` environmental variable.
```bash
-
```

## Option flag
Certain commands and builtins use the `+` to enable certain options and the `-` to disable them. In parameter substitution, the `+` prefixes an alternate value that a variable expands to.
```bash
+
```

## Current working directory
This corresponds to the `$PWD` internal variable.
```bash
~+
```

## Previous working directory
This corresponds to the `$OLDPWD` internal variable.
```bash
~-
```
