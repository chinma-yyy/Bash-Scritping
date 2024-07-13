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

- **`${string/%substring/replacement}`**
  
  If `$substring` matches back end of `$string`, substitute `$replacement` for `$substring`.

  ```bash
  string="Hello, world!"
  echo ${string/%world!/Universe}  # Outputs: Hello, Universe
  ```
