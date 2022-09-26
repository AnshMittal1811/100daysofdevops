#!/bin/bash
FILE="$1"
if [ -f $FILE ]; then
   echo "The file '$FILE' exists."
else
   echo "The file '$FILE' in not found."
fi
