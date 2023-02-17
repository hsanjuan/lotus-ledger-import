#!/bin/bash

set -e

address=$1
path=$2

if [[ $address = "-h" || $address = "--help" || $address = "" || $path = "" ]]; then
    echo "Usage: ./lotus-ledger-import.sh <address> <path-number> | lotus wallet import"
    echo
    echo "For example:"
    echo
    echo "     ./lotus-ledger-import.sh f13axsep7pxe3klr5b7rdc5w5qfgkefdao5czzxvy 5"
    echo 
    echo "...where '5' is the last number in the Ledger key path:"
    echo
    printf "     m/44\'/461\'/0\'/0/5"
    echo
    echo
    echo "You can list keys and paths using lotus-shed."
    exit 0
fi

jsonk="{\"Address\":\"${address}\",\"Path\":[2147483692,2147484109,2147483648,0,${path}]}"

base64jsonk=$(printf "%s" "$jsonk" | base64 -w 0)

exportjson="{\"Type\":\"secp256k1-ledger\",\"PrivateKey\":\"$base64jsonk\"}"

printf "%s" "$exportjson" | xxd -ps -c 0
