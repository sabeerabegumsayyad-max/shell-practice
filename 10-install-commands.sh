#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "please run this script with root access "
    exit 1
else
    echo "running this script with root access "
fi

dnf install mysql -y
