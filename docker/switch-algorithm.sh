#!/bin/bash

if grep -q DualAscent ../src/main/resources/floodlightdefault.properties; then
	sed -i 's/topology.DualAscentTopologyManager/topology.TopologyManager/g' ../src/main/resources/floodlightdefault.properties
	echo 'switched to dijkstra :('
else
	sed -i 's/topology.TopologyManager/topology.DualAscentTopologyManager/g' ../src/main/resources/floodlightdefault.properties
	echo 'switched to dual ascent :)'
fi
