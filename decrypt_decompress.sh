#!/bin/bash
#decrypt_and_decompress.sh

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please supply the file name."
    exit 1
fi

ENCRYPTED_FILE_NAME=$1
DECRYPTED_FILE_NAME=${ENCRYPTED_FILE_NAME%.enc}
DECOMPRESSED_FILE_NAME=${DECRYPTED_FILE_NAME%.gz}

#Decrypt the file
openssl aes-256-cbc -d -a -in $ENCRYPTED_FILE_NAME -out $DECRYPTED_FILE_NAME -pass pass:yourpassword

#Decompress the file
gunzip $DECRYPTED_FILE_NAME
