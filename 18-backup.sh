#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  # Default to 14 days if not provided

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +Y-%m-%d-%H-%M-%S )
LOG_FILE_NAME="$LOGS_FOLDER/"$LOG_FILE"-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
    echo -e "$2 ......$R FAILURE $N"
    exit 1
    else
    echo -e "$2 ......$G SUCCESS $N"
    fi  
}

USAGE(){
    echo -e "$R USAGE:: $N sh 18-backup.sh <SOURCE_DIRECTORY> <DESTINATION_DIRECTORY> [DAYS_OLD]"
    exit 1
}

mkdir -p /home/ec2-user/shellscipt-logs/

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R ERROR: Source directory $SOURCE_DIR does not exist. $N"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo -e "$R ERROR: Destination directory $DEST_DIR does not exist. $N"
    exit 1
fi

echo "Script started executed at: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

echo "Files to be backed up: $FILES"

if [ -z "$FILES" ]
then
    echo "No files found older than $DAYS days to back up."
    exit 0
fi