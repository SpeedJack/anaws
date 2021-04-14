#!/bin/bash
if [ $# -eq 0 ]
then
	CONTROLLERIP=$(ping -c1 fl | sed -nE 's/^PING[^(]+\(([^)]+)\).*/\1/p')
else
	CONTROLLERIP="$1"
fi

sudo mn --topo linear,3 \
--mac \
--switch ovs,protocols=OpenFlow14 \
--controller remote,ip=$CONTROLLERIP,port=6653,protocols='OpenFlow14' \
--ipbase=10.0.0.0
