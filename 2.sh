#!/bin/bash
read -p "Digite la extension: " extension

results=$(find *.$extension)
for file in $results
do
        size=$(du -k $file | cut -f1)
        if ! [ -d backup ]; then
                mkdir backup
        fi
        if [ $size -gt 2 ]; then
                cp $file backup
                echo Se copio el archivo $file
        fi
done