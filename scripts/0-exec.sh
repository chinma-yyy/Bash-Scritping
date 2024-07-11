#!/bin/bash

if [ -z "$1" ]
then
    echo "Provide the filename"
    exit 75
fi

filename=$1

if [ -e "$filename" ]
then
    chmod +x $filename
    ./$filename 
