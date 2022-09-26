#!/bin/bash
FILE="/etc/passwd"
if [ -f $FILE ]; then
   echo "The file '$FILE' exists."
else
   echo "The file '$FILE' in not found."
fi
