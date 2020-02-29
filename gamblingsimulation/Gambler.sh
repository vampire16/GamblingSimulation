#!/bin/bash -x

echo "Welcome"

#CONSTANT VARIABLES
MYSTAKE=100
FIFTYPERCENTSTAKE=$(($MYSTAKE*50/100))
MINFIFTYPERCENT=$(($MYSTAKE - $FIFTYPERCENTSTAKE))
MAXFIFTYPERCENT=$(($MYSTAKE + $FIFTYPERCENTSTAKE))
BET=1

#VARIABLES
stake=$MYSTAKE

#CHECK WIN OR LOOSE
while (( stake >= MINFIFTYPERCENT && stake <= MAXFIFTYPERCENT ))
do
	randomCheck=$((RANDOM%2))
	if (( randomCheck == 0 ))
	then
		stake=$(($stake+$BET))
	else
		stake=$(($stake-$BET))
	fi
done
