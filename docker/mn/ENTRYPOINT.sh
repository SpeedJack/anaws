#!/usr/bin/env bash

service ssh start
service openvswitch-switch start
ovs-vsctl set-manager ptcp:6640

tail -f /dev/null
