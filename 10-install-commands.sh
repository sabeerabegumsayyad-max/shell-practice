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

if [ $? -eq 0]
then
    echo "mysql already installed"
    exit1
else
    echo "mysql is not installed ...going to install"
    dnf install mysql -y

    if [ $? -eq 0 ] 
    then
        echo " mysql install is success"
    else
        echo " mysql install is failure"
        exit 1
    fi
fi

dnf list installed python3
if [ $? -eq 0 ]
then
    echo "python3 already installed nothing to do"
    exit 1
else
    echo "python is not installed going to install it"
    dnf install python3 -y

    if [ $? -eq 0 ]
    then
        echo "python3 installation success"
    else
        echo "python3 installation failed"
        exit 1
    fi
fi
