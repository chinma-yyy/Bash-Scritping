# Regular Expressions
## A Good reference for beginning 
https://youtu.be/77I4ZkhuHsQ?si=mZROxWOptADFnRit

Bash supports various regular expression constructs for pattern matching. Below are some of the common constructs along with examples.

### Dot `.`

- **`.` matches any one character, except a newline.**

  ```bash
  echo "abc" | grep -E 'a.c'  # Matches: abc
  ```

### Asterisk `*`

- **`*` matches any number of repeats of the character string or RE preceding it, including zero instances.**

  ```bash
  echo "abbbc" | grep -E 'ab*c'  # Matches: abbbc, abc
  ```

### Caret `^`

- **`^` matches the beginning of a line.**

  ```bash
  echo "hello" | grep -E '^he'  # Matches: hello
  ```

- **`^` negates the meaning of a set of characters in an RE when inside brackets.**

  ```bash
  echo "hello" | grep -E '[^aeiou]'  # Matches: h, l, l (any non-vowel)
  ```

### Dollar Sign `$`

- **`$` at the end of an RE matches the end of a line.**

  ```bash
  echo "hello" | grep -E 'lo$'  # Matches: hello
  ```

- **`^$` matches blank lines.**

  ```bash
  echo -e "hello\n\nworld" | grep -E '^$'  # Matches: (a blank line)
  ```

### Brackets `[...]`

- **`[...]` enclose a set of characters to match in a single RE.**

  ```bash
  echo "abc" | grep -E '[abc]'  # Matches: a, b, c
  ```

- **`[c-n]` matches any one of the characters in the range c to n.**

  ```bash
  echo "hello" | grep -E '[e-o]'  # Matches: e, l, l, o
  ```

- **`[B-Pk-y]` matches any one of the characters in the ranges B to P and k to y.**

  ```bash
  echo "kilo" | grep -E '[B-Pk-y]'  # Matches: k, i, l, o
  ```

- **`[a-z0-9]` matches any single lowercase letter or any digit.**

  ```bash
  echo "a1b2c3" | grep -E '[a-z0-9]'  # Matches: a, 1, b, 2, c, 3
  ```

- **`[^b-d]` matches any character except those in the range b to d.**

  ```bash
  echo "abcd" | grep -E '[^b-d]'  # Matches: a
  ```

### Backslash `\`

- **`\` escapes a special character, which means that character gets interpreted literally.**

  ```bash
  echo "price: $100" | grep -E 'price: \$100'  # Matches: price: $100
  ```

### Escaped Angle Brackets `\<...\>`

- **`\<...\>` mark word boundaries.**

  ```bash
  echo "the there other" | grep -E '\<the\>'  # Matches: the (only the word "the")
  ```

### Question Mark `?`

- **`?` matches zero or one of the previous RE.**

  ```bash
  echo "color" | grep -E 'colou?r'  # Matches: color, colour
  ```

### Plus `+`

- **`+` matches one or more of the previous RE.**

  ```bash
  echo "aaa" | grep -E 'a+'  # Matches: aaa
  ```

### Non-Whitespace Character `\S`

- **`\S` matches any non-whitespace character.**

  ```bash
  echo "word1 word2" | grep -P '\S'  # Matches: w, o, r, d, 1, w, o, r, d, 2
  ```

### Whitespace Character `\s`

- **`\s` matches any whitespace character.**

  ```bash
  echo "word1 word2" | grep -P '\s'  # Matches: (space between word1 and word2)
  ```

### Parentheses `(...)`

- **`(...)` groups a sequence of characters.**

  ```bash
  echo "abcabc" | grep -E '(abc)+'  # Matches: abcabc
  ```

### Alternation `|`

- **`|` acts as a logical OR to match either the expression before or the expression after.**

  ```bash
  echo "dog cat" | grep -E 'dog|cat'  # Matches: dog, cat
  ```

### Curly Braces `{}`

- **`{n}` matches exactly n occurrences of the preceding RE.**

  ```bash
  echo "aaa" | grep -E 'a{3}'  # Matches: aaa
  ```

- **`{n,}` matches n or more occurrences of the preceding RE.**

  ```bash
  echo "aaaa" | grep -E 'a{2,}'  # Matches: aaaa
  ```

- **`{n,m}` matches between n and m occurrences of the preceding RE.**

  ```bash
  echo "aaaa" | grep -E 'a{2,3}'  # Matches: aaa
  ```

### Word Boundaries `\b` and `\B`

- **`\b` matches a word boundary.**

  ```bash
  echo "hello world" | grep -E '\bworld\b'  # Matches: world
  ```

- **`\B` matches a non-word boundary.**

  ```bash
  echo "hello world" | grep -E 'wo\Brld'  # Matches: world
  ```

### Positive Lookahead `(?=...)`

- **`(?=...)` asserts that what follows the regex must match `...`.**

  ```bash
  echo "abc123" | grep -P 'abc(?=\d)'  # Matches: abc (followed by a digit)
  ```

### Negative Lookahead `(?!...)`

- **`(?!...)` asserts that what follows the regex must not match `...`.**

  ```bash
  echo "abc123" | grep -P 'abc(?!\d)'  # Does not match: abc (followed by a digit)
  ```

### Positive Lookbehind `(?<=...)`

- **`(?<=...)` asserts that what precedes the regex must match `...`.**

  ```bash
  echo "123abc" | grep -P '(?<=\d)abc'  # Matches: abc (preceded by a digit)
  ```

### Negative Lookbehind `(?<!...)`

- **`(?<!...)` asserts that what precedes the regex must not match `...`.**

  ```bash
  echo "abc123" | grep -P '(?<!\d)abc'  # Does not match: abc (preceded by a digit)
  ```

### Start of Word `\y`

- **`\y` matches the start of a word.**

  ```bash
  echo "hello world" | grep -P '\yworld'  # Matches: world
  ```

### End of Word `\Y`

- **`\Y` matches the end of a word.**

  ```bash
  echo "hello world" | grep -P 'world\Y'  # Matches: world
  ```

### Digit `\d` and Non-Digit `\D`

- **`\d` matches any digit (equivalent to `[0-9]`).**

  ```bash
  echo "123abc" | grep -P '\d'  # Matches: 1, 2, 3
  ```

- **`\D` matches any non-digit.**

  ```bash
  echo "123abc" | grep -P '\D'  # Matches: a, b, c
  ```

### Word Character `\w` and Non-Word Character `\W`

- **`\w` matches any word character (equivalent to `[a-zA-Z0-9_]`).**

  ```bash
  echo "word123" | grep -P '\w'  # Matches: w, o, r, d, 1, 2, 3
  ```

- **`\W` matches any non-word character.**

  ```bash
  echo "word123!" | grep -P '\W'  # Matches: !
  ```


### Example 1: Validate an Email Address
```bash
echo "user@example.com" | grep -E '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
# Matches: user@example.com
```

### Example 2: Extract Domain from URL
```bash
echo "https://www.example.com/page" | grep -oP 'https?://\K[^/]+'
# Matches: www.example.com
```

### Example 3: Match a Date in YYYY-MM-DD Format
```bash
echo "2024-07-10" | grep -E '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
# Matches: 2024-07-10
```

### Example 4: Extract File Extension
```bash
echo "document.pdf" | grep -oE '\.[a-zA-Z0-9]+$'
# Matches: .pdf
```

### Example 5: Match U.S. Phone Number
```bash
echo "(123) 456-7890" | grep -E '^\(\d{3}\) \d{3}-\d{4}$'
# Matches: (123) 456-7890
```

### Example 6: Find Words Starting with a Specific Letter
```bash
echo "apple banana cherry" | grep -oE '\<a[a-zA-Z]*\>'
# Matches: apple
```

### Example 7: Match IPv4 Address
```bash
echo "192.168.1.1" | grep -E '^([0-9]{1,3}\.){3}[0-9]{1,3}$'
# Matches: 192.168.1.1
```

### Example 8: Extract Text Within Parentheses
```bash
echo "This is a (test)" | grep -oP '\(\K[^)]+'
# Matches: test
```

### Example 9: Match Only Whole Words
```bash
echo "hello world" | grep -oE '\bworld\b'
# Matches: world
```

### Example 10: Match Lines Containing Only Digits
```bash
echo "12345" | grep -E '^[0-9]+$'
# Matches: 12345
```

### Example 11: Validate Floating Point Number
```bash
echo "3.14" | grep -E '^[+-]?([0-9]*[.])?[0-9]+$'
# Matches: 3.14
```

### Example 12: Match Hexadecimal Numbers
```bash
echo "0x1A3F" | grep -E '^0x[0-9A-Fa-f]+$'
# Matches: 0x1A3F
```

### Example 13: Validate a Strong Password
```bash
echo "StrongP@ssw0rd!" | grep -E '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$'
# Matches: StrongP@ssw0rd!
```

### Example 14: Match MAC Address
```bash
echo "01:23:45:67:89:AB" | grep -E '^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$'
# Matches: 01:23:45:67:89:AB
```

### Example 15: Extract Lines Matching a Pattern from a Log File
```bash
grep -E 'ERROR|WARNING' /var/log/syslog
# Matches lines containing "ERROR" or "WARNING" in the syslog file
```


# Globbing Wildcards and Patterns

Bash supports **globbing** for filename expansion and pattern matching. Below are common wildcards used in globbing:
 
### Wildcards

| Wildcard | Description | Example |
|----------|-------------|---------|
| `*`      | Matches any string of characters (including none). | `*.txt` matches all `.txt` files. |
| `?`      | Matches exactly one character. | `file?.txt` matches `file1.txt` but not `file12.txt`. |
| `[...]`  | Matches any one character within the brackets. | `file[abc].txt` matches `filea.txt`, `fileb.txt`, `filec.txt`. |
| `[^...]` | Matches any one character not in the brackets. | `file[^a].txt` matches `fileb.txt`, `file1.txt`, but not `filea.txt`. |
| `{...}`  | Matches any of the specified patterns. | `file{1,2,3}.txt` matches `file1.txt`, `file2.txt`, `file3.txt`. |

### Examples

1. **Match All Text Files**
   ```bash
   ls *.txt  # Lists all files with .txt extension
   ```

2. **Match Any Single Character**
   ```bash
   ls file?.txt  # Lists files like file1.txt, file2.txt
   ```

3. **Match Specific Characters**
   ```bash
   ls file[abc].txt  # Matches filea.txt, fileb.txt, filec.txt
   ```

4. **Exclude Specific Characters**
   ```bash
   ls file[^a].txt  # Matches all files except filea.txt
   ```

5. **Match Multiple Patterns**
   ```bash
   ls file{1,2,3}.txt  # Matches file1.txt, file2.txt, file3.txt
   ```

### Combining Wildcards

You can combine wildcards for more complex patterns. For example:

```bash
ls *.{txt,csv}  # Matches all .txt and .csv files
```

