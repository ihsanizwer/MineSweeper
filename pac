#!/bin/bash

if [ $# -lt 1 ];then
	echo "Invalid arguments. Please check and resubmit."
	exit 1
fi

ping -c 1 $1 > /dev/null

if [ $? -eq 0 ];then
	echo "$1 is online"
fi