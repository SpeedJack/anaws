#!/bin/bash

sudo truncate -s 0 $(docker inspect --format='{{.LogPath}}' fl)
