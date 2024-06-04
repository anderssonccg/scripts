#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Debe pasar un parametro: $0 <extension>"
    exit 1
fi

extension=$1
files=$(ls *.$extension)
dat=$(date +%Y-%m-%d)
while read -r line
do 
    echo $line
    if ! [ -z $line ];then
        mv $line "$dat-$line"
    fi
done <<< $files