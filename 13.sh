#!/bin/bash

read -p "Digite el nombre del usuario: " user

if id $user 2&>/dev/null; then
    uid=$(id -u $user)
    primary_group=$(id -ng $user)
    secondary_groups=$(id -nG $user)
    echo "UID: $uid"
    echo "Grupo primario: $primary_group"
    echo "Grupos secundarios: $secondary_groups"
else
    echo El usuario no existe
fi