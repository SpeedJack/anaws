#!/bin/bash

# https://www.liquidweb.com/kb/how-to-install-docker-on-ubuntu-14-04-lts/

sudo docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 -p 6653:6653 --name onos onosproject/onos
