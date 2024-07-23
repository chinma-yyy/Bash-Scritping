#!/bin/bash
for filename in *
do
fname=`basename $filename`
n=`echo $fname | tr A-Z a-z`
if [ "$fname" != "$n" ]
then
echo $fname
mv $fname $n
else
echo "$fname is all lower case"
fi
done
exit $?