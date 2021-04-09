#!/bin/bash


if [ $# -eq 0 ]
then
	CONTROLLERIP=127.0.0.1
else
	CONTROLLERIP="$1"
fi

sudo mn --topo single,3 \
--mac \
--switch ovsk \
--controller remote,ip=$CONTROLLERIP,port=6653,protocols=OpenFlow13 \
--ipbase=10.0.0.0
