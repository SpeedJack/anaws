#!/bin/bash
if [ $# -eq 0 ]
then
	CONTROLLERIP=$(ping -c1 fl | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
else
	CONTROLLERIP="$1"
fi

sudo mn \
--custom nostra-topo.py \
--topo tower \
--mac \
--switch ovsk \
--controller remote,ip=$CONTROLLERIP,port=6653,protocols='OpenFlow15'
