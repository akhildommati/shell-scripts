#!/bin/bash

USERID=$(id -u)
VALIDATE(){
    if [$1 -ne 0]
    then 
    echo "$2 Mysql.....FAILURE"
    exit 1
    else
    echo "$2 Mysql.....SUCCESS"
    fi  
}

if [ $USERID -ne 0 ]
then
    echo "ERROR : you must have sudo access to execute this script."
    exit 1
fi  

dnf list installed mysql

if [$? -ne 0] # not installed
then
    dnf install mysql -y
    VALIDATE $? ""Installing Mysql
else
    echo "Mysql is already installed"
fi  

dnf list installed git

if [$? -ne 0] # not installed
then
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed"
fi


