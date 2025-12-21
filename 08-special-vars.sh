#!/bin/bash

echo "All variables passed: $@"
echo "Number of arguments: $#"
echo "Script name: $0"
echo "present working directory: $PWD"
echo "home directory of current user: $HOME"
echo "which user is executing the script: $USER"
echo "Process ID of current script: $$"
sleep 60 &
echo "process ID of last executed command: $!"