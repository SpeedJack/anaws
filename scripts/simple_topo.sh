#!/bin/bash
if [ $# -eq 0 ]
then
	CONTROLLERIP=$(ping -c1 fl | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
else
	CONTROLLERIP="$1"
fi

sudo mn --topo single,3 \
--mac \
--switch ovsk \
--controller remote,ip=$CONTROLLERIP,port=6653,protocols=OpenFlow15 \
--ipbase=10.0.0.0
