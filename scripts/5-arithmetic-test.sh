#!/bin/bash

(( 0 ))
echo "Exit status of ((0)) is "$?""

(( 1 ))
echo "Exit status of ((1)) is "$?""

var1=5
var2=7

if (( var1 > var2 ))
then 
echo "Var1 is greater "
else
echo "var2 is greater"
fi
exit