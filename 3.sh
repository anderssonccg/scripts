#!/bin/bash

if [ $# -eq 0 ]; then
        echo "Error! No has pasado un numero como argumento"
        exit 1
fi

levels=$1
n=1

while [ $n -le  $levels ]; do
        y=1
        string=""
        while [ $y -le $n ]; do
                string="$string 0$n"
                y=$(($y + 1))
        done
        echo "$string"
        n=$(($n + 1))
done