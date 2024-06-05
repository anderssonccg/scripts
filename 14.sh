#!/bin/bash

read -p "Digite el nombre del grupo: " group

text=$(grep ^$group /etc/group)

if ! [ -z $text ]; then
    gid=$(cut -d ":" -f 3 <<< $text)
    search_primary=$(grep $gid /etc/passwd)
    primary=""
    while read -r line
    do
        if [ $(cut -d ":" -f 3 <<< $line) -eq $gid ]; then
            user=$(cut -d ":" -f 1 <<< $line)
            primary="$primary $user"
        fi
    done <<< $search_primary
    secondary=$(cut -d ":" -f 4 <<< $text)
    echo "GID: $gid"
    echo "Usuarios como grupo primario: $primary"
    echo "Usuarios como grupo secundario: $secondary"
else
    echo El grupo no existe
fi