#!/bin/bash

get_opt_simple(){
    echo "Here we are doing this"
    echo "Parameters are $*"
    until [ -z $1 ]
    do
        echo "Processing $1"
        if [ ${1:0:1} = '/' ]
        then 
            strip=${1:1}
            echo $strip
            parameter=${strip%%=*}
            value=${strip##*=}
            echo "We have our param $parameter $value"
        fi
        shift
    done
}

get_opt_simple $*

echo "done"

exit 0
