#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR : you must have sudo access to execute this script."
    exit 1
fi  

dnf list installed mysql

if [$? -ne 0] # not installed
then
    dnf install mysql -y
    if [$? -ne 0]
    then 
    echo "Installing Mysql.....FAILURE"
    exit 1
    else
    echo "Installing Mysql.....SUCCESS"
    fi  
else
    echo "Mysql is already installed"
fi  

dnf install mysql -y

# if [$? -ne 0]
# then 
# echo "Installing Mysql.....FAILURE"
# exit 1
# else
# echo "Installing Mysql.....SUCCESS"
# fi


dnf list installed git

if [$? -ne 0] # not installed
then
    dnf install git -y
    if [$? -ne 0]
    then 
    echo "Installing Git.....FAILURE"
    exit 1
    else
    echo "Installing Git.....SUCCESS"
    fi  
else
    echo "Git is already installed"
fi


# if [$? -ne 0]
# then 
# echo "Installing Git.....FAILURE"
# exit 1
# else
# echo "Installing Git.....SUCCESS"
# fi
