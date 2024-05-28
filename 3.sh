#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Debes pasar un argumento: <numero>"
        exit 1
fi
text=""
for (( i=1; i<=$1; i++ ))
do
        for (( j=1; j<=i; j++ ))
        do
                if [ $i -ge 0 ] && [ $i -le 9 ]; then
                        text="$text 0$i"
                else
                        text="$text $i"
                fi
        done
        text="$text\n"
done

echo -e $text