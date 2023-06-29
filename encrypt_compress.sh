#!/bin/bash
#encrypt_and_compress.sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please supply the file name."
    exit 1
fi

FILE_NAME=$1
ENCRYPTED_FILE_NAME="$FILE_NAME.enc"

#Compress the file
gzip $FILE_NAME

#Encrypt the file
openssl aes-256-cbc -a -salt -in "$FILE_NAME.gz" -out $ENCRYPTED_FILE_NAME -pass pass:yourpassword
