#!/bin/bash
if [ $# -eq 0 ]
then
	CONTROLLERIP=127.0.0.1
else
	CONTROLLERIP="$1"
fi
sudo mn --custom spine-leaf.py --topo tower --mac --switch ovsk --controller remote,ip=$CONTROLLERIP,port=6653,protocols=OpenFlow13