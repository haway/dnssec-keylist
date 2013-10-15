#!/bin/bash
#
# version 0.1.1

DIR=$1
DN=$2

if [ "x$DIR" == "x" ];then
	DIR=$(PWD)
fi

NOW=$(date '+%s')
KEYS=$(find $DIR -name "K$DN*.key")

echo "===================================="
echo "*DN : $DN "
echo "*NOW: $NOW "
echo "===================================="


for KEY in $KEYS
do
	echo "$(basename $KEY)"
	inactive=$(dnssec-settime -p I -u $KEY)
	inactive2=$(echo $inactive | cut -d':' -f2 )
	echo -n " +----> "

	grep -q "DNSKEY 256" $KEY
	if [ "$?" == "0" ]; then
		echo -n "(ZSK)"
	fi

	grep -q "DNSKEY 257" $KEY
	if [ "$?" == "0" ]; then
		echo -n "(KSK)"
	fi

	if [ "$inactive2" == " UNSET" ]; then
		echo "Always avaiable(UNSET Inactive Time)"
	else
		bcr=$(echo "$inactive2 > $NOW" | bc)
		if [ "$bcr" == "1" ]; then
			echo "Avaiable";
		else
			echo "Inactive";
		fi
	fi
	echo " "
done
