#!/bin/bash

userid=$(id -u)
timestamp=$(date +%f-%h-%M-%s)
script_name=$(echo $0 | cut -d "." -f1)
logfile=/tmp/$script_name-$timestamp.log

VALIDATE(){
   if [ $1 -ne 0 ]
   then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2...SUCCESS"
    fi

    if [ $USERID -ne 0 ]
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql -y &>>$logfile
VALIDATE $? "Installing MySQL"

dnf install mysql -y &>>$logflie
VALIDATE $? "installing mysql"