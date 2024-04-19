#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]

then 
echo "please run this script wit root access"
exit 1

else 
echo "you are super user"
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then 
echo "installation of mysql...failure"
exit 1
fi
dnf install git -y
echo "is script proceeding?"