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
win=0
loose=0

#CHECK WIN OR LOOSE
for (( index=1; index<=20; index++ ))
do
	stake=$MYSTAKE
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
	if (( stake > MAXFIFTYPERCENT ))
	then
		((win++))
	else
		((loose++))
	fi
done
totalWin=$(($win*$FIFTYPERCENTSTAKE))
totalLoose=$(($loose*$FIFTYPERCENTSTAKE))
echo "Total win for a day : $totalWin"
echo "Total loose for a day : $totalLoose"
