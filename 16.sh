#!/bin/bash

# 16. Crear un shell script que cree en un  archivo “dir.txt”
# los nombres de todos los directorios nivel superior de donde es invocado el script.

current=$(pwd)

rm dir.txt 2> /dev/null
touch dir.txt

cd ..

for dir in $(ls); do
    if [ -d $dir ]; then
        echo $dir >> $current/dir.txt
    fi
done

cd $current