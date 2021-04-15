#!/bin/bash

sudo docker-compose down
sudo ./recompile.sh
sudo docker-compose up -d
