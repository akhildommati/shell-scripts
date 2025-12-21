#!/bin/bash

NUMBER=$1

# -gt, -lt, -ge, -le, -eq, -ne

if [ $NUMBER -gt 100 ]
then
    echo "Given number is greater than 100"
else
    echo "Given number is less than or equal to 100"
fi
