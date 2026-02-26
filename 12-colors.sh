#!/bin/bash

userid=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then
    echo "please run this script with root access "
    exit 1
else
    echo "running this script with root access "
fi

VALIDATE(){
    if [ $1 -eq 0 ] 
    then
        echo -e " $2 install is $Y success $N"
    else
        echo " $2 install is failure"
        exit 1
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed ...going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e " $Y mysql already installed nothing to do $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed ...going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e " $Y python3 already installed nothing to do $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed ...going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx already installed nothing to do $N"
    exit 1
fi