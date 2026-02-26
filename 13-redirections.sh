#!/bin/bash

userid=$(id -u)
logs_folder="/var/log/shallscript-logs"
scriptname=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$scriptname.log"

mkdir -p $logs_folder
echo "script starting executing at : $(date)"| tee -a $log_file
if [ $userid -ne 0 ]
then
    echo "please run this script with root access ">>$log_file
    exit 1
else
    echo "running this script with root access " | tee -a $log_file
fi

VALIDATE(){
    if [ $1 -eq 0 ] 
    then
        echo " $2 install is success">>$log_file
    else
        echo " $2 install is failure">>$log_file
        exit 1
    fi
}

dnf list installed mysql>>$log_file

if [ $? -ne 0 ]
then
    echo "mysql is not installed ...going to install" | tee -a $log_file
    dnf install mysql -y>>$log_file
    VALIDATE $? "mysql"
else
    echo "mysql already installed nothing to do" | tee -a $log_file
fi

dnf list installed python3>>$log_file
if [ $? -ne 0 ]
then
    echo "python3 is not installed ...going to install" | tee -a $log_file
    dnf install python3 -y>>$log_file
    VALIDATE $? "python3"
else
    echo "python3 already installed nothing to do" | tee -a $log_file
fi

dnf list installed nginx>>$log_file
if [ $? -ne 0 ]
then
    echo "nginx is not installed ...going to install" | tee -a $log_file
    dnf install nginx -y>>$log_file
    VALIDATE $? "nginx"
else
    echo "nginx already installed nothing to do" | tee -a $log_file
    exit 1
fi