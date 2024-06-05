#!/bin/bash

export ATTEMPTS=1

while true
do
    read -p "Digita el UID: " num
    if [ $num -eq $UID ]; then
        echo "Lo lograste, te ha tomado $ATTEMPTS intentos"
        exit 0
    elif [ $num -gt $UID ]; then
        echo "El numero $num es mayor que el UID"
    else
        echo "El numero $num es menor que el UID"
    fi
    export ATTEMPTS=$(($ATTEMPTS + 1))
done