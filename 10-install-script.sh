#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR :: Please run this script as root or using sudo."
    exit 1 #other than 0 means error
fi

dnf install mysqll -y

dnf install git -y