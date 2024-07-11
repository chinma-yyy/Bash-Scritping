#!/bin/bash

echo
(( a = 23 ))
# Setting a value, C-style,
#+ with spaces on both sides of the "=".
echo "a (initial value) = $a"
# 23
(( a++ ))
# Post-increment 'a', C-style.
echo "a (after a++) = $a"
# 24
(( a-- ))
# Post-decrement 'a', C-style.
echo "a (after a--) = $a"
# 23
(( ++a ))
# Pre-increment 'a', C-style.
echo "a (after ++a) = $a"
# 24
(( --a ))
# Pre-decrement 'a', C-style.
echo "a (after --a) = $a"
# 23
echo