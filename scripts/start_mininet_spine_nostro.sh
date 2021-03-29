#!/bin/bash
sudo mn --custom spine-leaf-nostro.py --topo tower --mac --switch ovsk --controller remote,ip=127.0.0.1,port=6653,protocols=OpenFlow13
