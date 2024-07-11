#!/bin/bash
start=0
until [ $start -eq 10 ] ; do
    echo "$start"
    ((start++));
done

echo "Start value is "$start""
let "start+=1"
echo $start

while [ $start -le 10 ]; do
    echo "$start"
    : $[ start = $start + 1 ]
done

unset start

echo $start
while [ $start -le 10 ]; do
    echo "$start"
    ((start = start +1))
done
exit