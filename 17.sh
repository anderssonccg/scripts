#!/bin/bash

read -p "Digite el PID que quiere eliminar: " pid
if ps -p $pid 2&>/dev/null;then
    name=$(ps -p $pid -o comm=)
    kill $pid
    echo "El proceso $name con PID $pid ha sido eliminado"
else
    echo "El proceso con PID $pid no existe en el sistema"
fi