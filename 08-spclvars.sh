#!/bin/bash

echo "to get values $@"
echo "no of variables $#"
echo "scriptname : $0"
echo "current directory : $PWD "
echo " user name : $USER "
echo " home dir : $HOME "
echo " PiD of current script : $$ "
sleep 30 &
echo " PID of back bgound ID : $! "