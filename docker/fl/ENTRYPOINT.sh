#!/usr/bin/env bash

cd /usr/src/myapp

if [ ! -f target/floodlight.jar ]
then
	mvn package -Dmaven.test.skip=true 
fi

./floodlight.sh
# java -jar target/floodlight.jar
