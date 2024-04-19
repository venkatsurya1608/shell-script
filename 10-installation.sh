#!/bin/bash

userid=$(id -u)     #userid capical or normal letter use

if [ $userid -ne 0 ]

then 
echo "please run this script wit root access"
exit 1

else 
echo "you are super user"
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
echo "installation of mysql...failure"
exit 1
else
echo "installation of mysql...success"
fi
dnf install git -y

if [ $? -ne 0 ]
then 
echo "installation of git...failure"
exit 1
else
echo "installation of git...success"
fi
echo "is script proceeding?"