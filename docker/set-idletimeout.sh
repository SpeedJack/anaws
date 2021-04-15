#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'Are you drunk?'
	exit
fi

sed -i "s/Forwarding.idle-timeout=.*$/Forwarding.idle-timeout=$1/g" ../src/main/resources/floodlightdefault.properties
echo "idle-timeout=$1"
