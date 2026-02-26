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
    dnf install mysql -y

    if [ $? -eq 0 ] 
    then
        echo " mysql install is success"
    else
        echo " mysql install is failure"
        exit 1
    fi
fi


