# String
## String Manipulation in Bash

Bash provides various ways to manipulate strings, similar to string functions in C. Below are some common string operations.

### String Length

- **`${#string}`**
  
  ```bash
  string="Hello, world!"
  echo ${#string}  # Outputs: 13
  ```

- **`expr length $string`**

  ```bash
  string="Hello, world!"
  expr length "$string"  # Outputs: 13
  ```

- **`expr "$string" : '.*'`**

  ```bash
  string="Hello, world!"
  expr "$string" : '.*'  # Outputs: 13
  ```

### Length of Matching Substring at Beginning of String

- **`expr match "$string" '$substring'`**
	- So here there is no `()` in the substring so it gives you the number of letters matched.
- **`expr "$string" : '$substring'`**

  ```bash
  string="Hello, world!"
  substring="Hello"
  expr match "$string" "$substring"  # Outputs: 5
  ```

### Index

- **`expr index $string $substring`**

  Numerical position in `$string` of first character in `$substring` that matches.

  ```bash
  string="Hello, world!"
  substring="o"
  expr index "$string" "$substring"  # Outputs: 5
  ```

### Substring Extraction

- **`${string:position}`**
  
  Extracts substring from `$string` starting at `$position`.

  ```bash
  string="Hello, world!"
  echo ${string:7}  # Outputs: world!
  ```

- **`${string:position:length}`**
  
  Extracts `$length` characters of substring from `$string` starting at `$position`.

  ```bash
  string="Hello, world!"
  echo ${string:7:5}  # Outputs: world
  ```

- **`expr substr $string $position $length`**
  
  Extracts `$length` characters from `$string` starting at `$position`.

  ```bash
  string="Hello, world!"
  expr substr "$string" 8 5  # Outputs: world
  ```

- **`expr match "$string" '\($substring\)'`**

  Extracts `$substring` at the beginning of `$string`, where `$substring` is a regular expression.
  Here we are escaping the `()`to be matched literally so we can have the matching string and not the number of matching characters.

  ```bash
  string="Hello, world!"
  expr match "$string" '\(Hello\)'  # Outputs: Hello
  ```

- **`expr "$string" : '\($substring\)'`**

  Extracts `$substring` at the beginning of `$string`, where `$substring` is a regular expression.

  ```bash
  string="Hello, world!"
  expr "$string" : '\(Hello\)'  # Outputs: Hello
  ```

### Substring Removal

- **`${string#substring}`**
  
  Deletes shortest match of `$substring` from front of `$string`.

  ```bash
  string="Hello, world!"
  echo ${string#Hello}  # Outputs: , world!
  ```

- **`${string##substring}`**
  
  Deletes longest match of `$substring` from front of `$string`.

  ```bash
  string="Hello, world!"
  echo ${string##*,}  # Outputs: world!
  ```

- **`${string%substring}`**
  
  Deletes shortest match of `$substring` from back of `$string`.

  ```bash
  string="Hello, world!"
  echo ${string%,*}  # Outputs: Hello
  ```

- **`${string%%substring}`**
  
  Deletes longest match of `$substring` from back of `$string`.

  ```bash
  string="Hello, world!"
  echo ${string%%,*}  # Outputs: Hello
  ```

### Substring Replacement

- **`${string/substring/replacement}`**
  
  Replace first match of `$substring` with `$replacement`.

  ```bash
  string="Hello, world!"
  echo ${string/world/Universe}  # Outputs: Hello, Universe!
  ```

- **`${string//substring/replacement}`**
  
  Replace all matches of `$substring` with `$replacement`.

  ```bash
  string="Hello, world! Hello, everyone!"
  echo ${string//Hello/Hi}  # Outputs: Hi, world! Hi, everyone!
  ```

- **`${string/#substring/replacement}`**
  
  If `$substring` matches front end of `$string`, substitute `$replacement` for `$substring`.

  ```bash
  string="Hello, world!"
  echo ${string/#Hello/Hi}  # Outputs: Hi, world!
  ```

### String Substitution
**`${string/%substring/replacement}`**

If `$substring` matches the back end of `$string`, substitute `$replacement` for `$substring`.

```bash
string="Hello, world!"
echo ${string/%world!/Universe}  # Outputs: Hello, Universe
```

### Variable Name Expansion
**`${!varprefix*}`**, **`${!varprefix@}`**

Matches names of all previously declared variables beginning with `varprefix`.

### Example
```bash
xyz23="foo"
xyz24="bar"

a=${!xyz*}
echo "a = $a"  # Outputs: a = xyz23 xyz24

a=${!xyz@}
echo "a = $a"  # Outputs: a = xyz23 xyz24
```

- Expands to *names* of declared variables beginning with "xyz".
- The output shows the names of the variables `xyz23` and `xyz24`.