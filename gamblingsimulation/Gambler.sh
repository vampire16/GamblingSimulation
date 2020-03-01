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

declare -a monthlyStakeArray
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
		monthlyStakeArray[$day]=$monthlystake
		echo "$day day $FIFTYPERCENTSTAKE $result $monthlystake"
	done
	luckiestDay=${monthlyStakeArray[1]}
	unluckiestDay=${monthlyStakeArray[1]}
	for (( i=1; i<=${#monthlyStakeArray[@]}; i++ ))
	do	
		if (( luckiestDay < ${monthlyStakeArray[$i]}))
		then
			luckiestDay=${monthlyStakeArray[$i]}
			luckyDay=$i
		elif ((unluckiestDay > ${monthlyStakeArray[$i]} ))
		then	
			unluckiestDay=${monthlyStakeArray[$i]}
			unluckyDay=$i
		fi
	done
	totalWin=$(($win*$FIFTYPERCENTSTAKE))
	totalLoose=$(($loose*$FIFTYPERCENTSTAKE))
	echo "Total win for a day : $totalWin"
	echo "Total loose for a day : $totalLoose"
	echo "luckiest day is $luckyDay = $luckiestDay"
	echo "unluckiest day is $unluckyDay = $unluckiestDay"
	if (( win > loose ))
	then
		read -p "Would you like to continue ? (yes or no) " choice
		if (( choice == "yes"))
		then	
			echo "OK"
		else	
			break
		fi
	else	
		break
	fi
	monthlystake=0
	win=0
	loose=0
	day=0
done