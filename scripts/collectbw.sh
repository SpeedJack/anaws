#!/bin/bash

if [ $# -ne 3 ]
then
	echo 'Invalid number of args'
	exit
fi

SERVERIP=$1

function prepend() {
	while read line;
	do
		echo "${1}${line}"
	done
}

if [ ! -f "bandwidth.csv" ]
then
	echo "repetition,client hostname,server hostname,timestamp,client ip,client port,server ip,server port,id,time interval,transferred bytes,bandwidth in bits/s" > "bandwidth.csv"
fi

for i in {1..30}
do
	printf "Repetition $i... "
	iperf -c $SERVERIP -i 1 -t 15 -e -y c | prepend "$i,$2,$3," >> "bandwidth.csv"
	echo "done!"
	sleep 10
done
