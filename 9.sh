#!/bin/bash

files=$(ls *.txt 2>/dev/null)

for file in $files
do
    lines=$(wc -l < $file)
    if [ $lines -gt 200 ]; then
        if ! [ -d "papelera" ]; then
            mkdir papelera
        fi
        touch papelera/$file
        back=$(tail -n 100 < $file)
        front=$(head -n $(($lines - 100)) < $file)
        printf "$front" > papelera/$file
        printf "$back" > $file
        bzip2 papelera/$file
    fi
done