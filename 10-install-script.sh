#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script as root or using sudo."
    exit 1 #other than 0 means error
fi

dnf install mysqll -y

if [ $? -ne 0 ]
then
    echo "ERROR :: MySQL installation failed."
    exit 1
else
    echo "MySQL installed successfully."
fi

dnf install git -y

if [ $? -ne 0 ]
then
    echo "ERROR :: Git installation failed."
    exit 1
else
    echo "Git installed successfully."
fi