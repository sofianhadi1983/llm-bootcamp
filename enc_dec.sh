#!/bin/bash

# Function to encrypt a file
encrypt() {
    if [ $# -ne 2 ]; then
        echo "Usage: encrypt <input_file> <output_file>"
        return 1
    fi
    openssl enc -aes-256-cbc -salt -in "$1" -out "$2"
    echo "File encrypted: $2"
}

# Function to decrypt a file
decrypt() {
    if [ $# -ne 2 ]; then
        echo "Usage: decrypt <input_file> <output_file>"
        return 1
    fi
    openssl enc -aes-256-cbc -d -in "$1" -out "$2"
    echo "File decrypted: $2"
}

# Check the operation
if [ "$1" == "encrypt" ]; then
    encrypt "$2" "$3"
elif [ "$1" == "decrypt" ]; then
    decrypt "$2" "$3"
else
    echo "Usage: ./encrypt_decrypt.sh <encrypt|decrypt> <input_file> <output_file>"
    exit 1
fi
