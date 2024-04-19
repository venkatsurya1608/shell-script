#!/bin/bash

echo "all variables: $@"
echo "number of variables passed : $#"
echo "script name : $0"
echo "current working directory : $pwd"
echo "home directory of current user : $home"
echo "which user is running this script :$user"
echo "hostname : $hostname"
echo "process id of the current shell script : $$"
echo "process id of the last background command : $!"
