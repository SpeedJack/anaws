#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'Are you drunk?'
	exit
fi

sed -i "s/TopologyManager.pathMetric=.*$/TopologyManager.pathMetric=$1/g" ../src/main/resources/floodlightdefault.properties
echo "pathMetric=$1"
