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