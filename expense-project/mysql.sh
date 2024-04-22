#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"USERID=$(id -u)
G="\e[32m"
N="\e[0m"

VALIDATE(){
   if [ $1 -ne 0 ] &>>$LOGFILE
   then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ] &>>$LOGFILE
then
    echo "Please run this script with root access."
    exit 1 # manually exit if error comes.
else
    echo "You are super user."
fi

dnf install mysql-server -y &>>$LOGFILE
VALIDATE $? "Installing Mysql Server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "Enabling the Mysql"

systemctl start mysqld &>>$LOGFILE
VALIDATE $? "starting Mysql"

mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
VALIDATE $? "set up root password"

echo 