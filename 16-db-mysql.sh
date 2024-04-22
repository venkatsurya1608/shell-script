#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"USERID=$(id -u)
G="\e[32m"
N="\e[0m"


VALIDATE(){
   if [ $1 -ne 0 ] &>>$LOGFLIE
   then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ] &>>$LOGFLIE
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql-server -y &>>$LOGFLIE
VALIDATE $? "Installing Mysql server"

systemctl enable mysqld &>>$LOGFLIE
VALIDATE $? "Enabaling Mysql server"

systemctl start mysqld &>>$LOGFLIE
VALIDATE $? "Starting Mysql server"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFLIE
VALIDATE $? "Mysql root password setup"