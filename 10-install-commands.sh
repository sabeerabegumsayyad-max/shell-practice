#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "please run this script with root access "
    exit 1
else
    echo "running this script with root access "
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed ...going to install"
    dnf install mysql -y

    if [ $? -eq 0 ] 
    then
        echo " mysql install is success"
    else
        echo " mysql install is failure"
        exit 1
    fi
else
    echo "mysql already installed nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed ...going to install"
    dnf install python3 -y

    if [ $? -eq 0 ] 
    then
        echo " python install is success"
    else
        echo " python install is failure"
        exit 1
    fi
else
    echo "python3 already installed nothing to do"
    exit 1
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed ...going to install"
    dnf install nginx -y

    if [ $? -eq 0 ] 
    then
        echo " nginx install is success"
    else
        echo " nginx install is failure"
        exit 1
    fi
else
    echo "nginx already installed nothing to do"
    exit 1
fi