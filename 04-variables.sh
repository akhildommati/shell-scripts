#!/bin/bash


# Get person names from command line arguments
# can supply names while running script like: bash 04-variables.sh Akhil Meghana
# If no names are supplied, variables will be empty

PERSON1=$1 # no space before and after equal
PERSON2=$2

echo "$PERSON1 : Hello $PERSON2"
echo "$PERSON2 : Hello $PERSON1"
echo "$PERSON1 : How are you?"
echo "$PERSON2 : I am fine, thank you!"