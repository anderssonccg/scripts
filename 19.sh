#!/bin/bash
files=$(ls *.jpg)
dat=$(date +%Y-%m-%d)
while read -r line
do 
    echo $line
    if ! [ -z $line ];then
        mv $line "$dat-$line"
    fi
done <<< $files