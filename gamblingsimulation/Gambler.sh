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
monthlystake=0
day=0
result=""

read -p "Enter months : " MONTH
#CHECK WIN OR LOOSE
for (( month=1; month<=MONTH; month++ ))
do
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
			(( win++ ))
			monthlystake=$(($monthlystake+$FIFTYPERCENTSTAKE))
			result="win"
		else
			(( loose++ ))
			monthlystake=$(($monthlystake-$FIFTYPERCENTSTAKE))
			result="loose"
		fi
	((day++))
echo "$day day $FIFTYPERCENTSTAKE $result"
done
totalWin=$(($win*$FIFTYPERCENTSTAKE))
totalLoose=$(($loose*$FIFTYPERCENTSTAKE))
echo "Total win for a day : $totalWin"
echo "Total loose for a day : $totalLoose"
monthlystake=0
win=0
loose=0
day=0
done