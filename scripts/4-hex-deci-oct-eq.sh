#!/bin/bash

hex=0x0f
decimal=15
octal=017


if [ "$hex" -eq "$decimal" ]
then
echo "Hex is equal to decimal"
else
echo "Hex is not equal to decimal"
fi

if [[ "$hex" -eq "$decimal" ]]
then
echo "Hex is equal to decimal"
else
echo "Hex is not equal to decimal"
fi

if [[ "$octal" -eq "$decimal" ]]
then
echo "Octal is equal to decimal"
else
echo "Octal is not equal to decimal"
fi

if [[ "$hex" -eq "$octal" ]]
then
echo "Hex is equal to octal"
else
echo "Hex is not equal to octal"
fi

exit
