#!/bin/bash -x

echo "Welcome"

#CONSTANT VARIABLES
MYSTAKE=100
BET=1

#VARIABLES
stake=$MYSTAKE

#CHECK WIN OR LOOSE
randomCheck=$((RANDOM%2))
if (( randomCheck == 0 ))
then
	stake=$(($stake+$BET))
else
	stake=$(($stake-$BET))
fi
