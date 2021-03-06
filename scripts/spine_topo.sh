#!/bin/bash
if [ $# -eq 0 ]
then
	CONTROLLERIP=$(ping -c1 fl | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
else
	CONTROLLERIP="$1"
fi

sudo mn \
--custom spine-leaf.py \
--topo tower \
--mac \
--switch ovs,protocols=OpenFlow13 \
--controller remote,ip=$CONTROLLERIP,port=6653,protocols='OpenFlow13'
