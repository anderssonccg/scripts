#!/bin/bash

files=$(ls)
directory=$(grep $(whoami) /etc/passwd | cut -d ":" -f 6)
for file in $files
do
    if [ -r $file ] && [ -w $file ] && [ -x $file ];then
        if ! [ -d "$directory/bin" ]; then
            mkdir $directory/bin
        fi
        cp $file $directory/bin/
    fi
done