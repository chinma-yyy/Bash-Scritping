#!/bin/bash

Suites="Clubs
Diamonds
Hearts
Spades"
Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

suites=($Suites)
denominations=($Denominations)

numSuites=${#suites[*]}
numDenominations=${#denominations[*]}

echo -n "${denominations[$((RANDOM%numDenominations))]} of "
echo ${suites[$((RANDOM%numSuites))]}

exit 0