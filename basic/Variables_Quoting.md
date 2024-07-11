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

## Quoting

- Quoting means just that, bracketing a string in quotes. This has the effect of protecting special characters in the string from reinterpretation or expansion by the shell or shell script. (A character is "special" if it has an interpretation other than its literal meaning. For example, the asterisk `*` represents a wild card character in globbing and Regular Expressions).

- Use double quotes to prevent word splitting. An argument enclosed in double quotes presents itself as a single word, even if it contains whitespace separators.

```bash
List="one two three"
variable1="a variable containing five words"
COMMAND This is $variable1
# Executes COMMAND with 7 arguments:
# "This" "is" "a" "variable" "containing" "five" "words"
COMMAND "This is $variable1"
# Executes COMMAND with 1 argument:
# "This is a variable containing five words"
variable2=""
# Empty.
COMMAND $variable2 $variable2 $variable2
# Executes COMMAND with no arguments.
COMMAND "$variable2" "$variable2" "$variable2"
# Executes COMMAND with 3 empty arguments.
COMMAND "$variable2 $variable2 $variable2"
# Executes COMMAND with 1 argument (2 spaces).
```

- Single quotes (`' '`) operate similarly to double quotes, but do not permit referencing variables, since the special meaning of `$` is turned off. Within single quotes, every special character except `'` gets interpreted literally. Consider single quotes ("full quoting") to be a stricter method of quoting than double quotes ("partial quoting").

  Since even the escape character (`\`) gets a literal interpretation within single quotes, trying to enclose a single quote within single quotes will not yield the expected result.

## Special meanings of certain escaped characters used with `echo` and `sed`

- `\n` means newline
- `\r` means return
- `\t` means tab
- `\v` means vertical tab
- `\b` means backspace
- `\a` means alert (beep or flash)
- `\0xx` translates to the octal ASCII equivalent of 0nn, where nn is a string of digits
