#!/bin/bash

userid=$(id -u)
logs_folder="/var/log/shallscript-logs"
scriptname=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$scriptname.log"

package=("mysql" "python" "nginx" "httpd")

mkdir -p $logs_folder
echo "script starting executing at : $(date)"| tee -a $log_file
if [ $userid -ne 0 ]
then
    echo "please run this script with root access "&>>$log_file
    exit 1
else
    echo "running this script with root access " | tee -a $log_file
fi

VALIDATE(){
    if [ $1 -eq 0 ] 
    then
        echo " $2 install is success"&>>$log_file
    else
        echo " $2 install is failure"&>>$log_file
        exit 1
    fi
}

for package in ${package[@]}
do
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]
    then
        echo "$package is not installed ...going to install" | tee -a $log_file
        dnf install $package -y&>>$log_file
        VALIDATE $? "$package"
    else
    echo "$package already installed nothing to do" | tee -a $log_file
    fi
done
