#!/bin/bash

a=2334
let "a += 1"
echo "a = $a"
b=${a/23/BB}
echo "b = $b"
declare -i b # even after declaring integer it is string
let "b += 1" # Bash sets the "integer value" of a string to 0.
echo "b = $b"
echo
e=''
echo "e = $e"
let "e += 1"
echo "e = $e"
echo 
exit 0
