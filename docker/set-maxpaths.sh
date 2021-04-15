#!/bin/bash

if [ $# -eq 0 ]; then
	echo 'Are you drunk?'
	exit
fi

sed -i "s/TopologyManager.maxPathsToCompute=.*$/TopologyManager.maxPathsToCompute=$1/g" ../src/main/resources/floodlightdefault.properties
echo "maxPathsToCompute=$1"
