#!/bin/bash

echo "all variables: $@"
echo "number of variables passed : $#"
echo "script name : $0"
echo "current working directory : $PWD"
echo "home directory of current user : $HOME"
echo "which user is running this script :$USER"
echo "hostname : $HOSTNAME"
echo "process id of the current shell script : $$"
sleep 200 &
echo "process id of the last background command : $!"

