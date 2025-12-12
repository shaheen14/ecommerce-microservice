#!/bin/bash

PORT=$1

if sudo lsof -i :$PORT >/dev/null 2>&1; then
	echo "Port $PORT is in use."
else
        echo "Port $PORT is free."
fi	
