#!/bin/bash

TIMER_INTERVAL=5

printAnswer(){
    if [ "$answer" = TIMEOUT ]
    then 
        echo "You have timed out T-T"
    else
        echo "Oh you answered in time : $answer"
    fi
}

TimerOn(){
    sleep $TIMER_INTERVAL && kill -s 14 $$ &
}

Int14Vector()
{
answer="TIMEOUT"
PrintAnswer
exit 3
}

trap Int14Vector 3

echo "What is your favorite vegetable "
TimerOn
read answer
printAnswer


