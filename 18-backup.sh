#!bin/bash

userid=$(id -u)
suorce_dir=$1
dest_dir=$2
days=$(3:-14) #if days are provideed it will be consider othervise 14 days

logs_folder="/var/log/shallscript-logs"
scriptname=$(echo $0 | cut -d "." -f1)
log_file="$logs_folder/$scriptname.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

check_root (){
echo "script starting executing at : $(date)"| tee -a $log_file
if [ $userid -ne 0 ]
then
    echo "please run this script with root access ">>$log_file
    exit 1
else
    echo "running this script with root access " | tee -a $log_file
fi
}

check_root

mkdir -p $logs_folder


USAGE(){
    echo -e "$R USAGE :: $N  sh 20-backup.sh <source_dir> <dest_dir> <days(optiobnal)>"
}
VALIDATE(){
    if [ $1 -eq 0 ] 
    then
        echo " $2 install is success">>$log_file
    else
        echo " $2 install is failure">>$log_file
        exit 1
    fi
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $source_dir ]
then
    echo -e "$R $suorce_dir does not exist. please check $N"
    exit 1
fi

if [ ! -d $dest_dir ]
then
    echo -e "$R $dest_dir does not exist. please check $N"
    exit 1
fi

