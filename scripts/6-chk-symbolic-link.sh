#!/bin/bash

# If no arguments are given, use the current directory, otherwise use the given directories
[ $# -eq 0 ] && directory=$(pwd) || directory=$@

linkchk () {
    for element in "$1"/* ; do
        # Check if the element is a symbolic link and if it is broken
        if [ -h "$element" ] && [ ! -e "$element" ]; then
            echo "\"$element\" is a broken symbolic link"
        fi
        
        # Check if the element is a directory and recurse into it
        if [ -d "$element" ]; then
            linkchk "$element"
        fi
    done
}

# Iterate over each directory provided in the arguments
for dir in $directory ; do
    echo "Checking directory: $dir"
    if [ -d "$dir" ]; then
        linkchk "$dir"
    else
        echo "$dir is not a directory"
    fi
done

exit
