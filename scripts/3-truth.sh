#!/bin/bash
echo "testing 0"
if [ 0 ]
then 
echo "0 is true"
else
echo "0 is false"
fi
echo 
echo "testing 1"
if [ 1 ];then 
echo "1 is true"
else
echo "1 is false"
fi
echo
echo "Testing \"-n \$xyz\""
if [ -n "$xyz" ]
# More pedantically correct.
then
echo "Uninitialized variable is true."
else
echo "Uninitialized variable is false."
fi
# Uninitialized variable is false.
echo

echo "Testing \"NULL\""
if [ ]
# NULL (empty condition)
then
echo "NULL is true."
else
echo "NULL is false."
fi
# NULL is false.
echo
echo "Testing \"xyz\""
if [ xyz ]
# string
then
echo "Random string is true."
else
echo "Random string is false."
fi
# Random string is true.
echo

exit