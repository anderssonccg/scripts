#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Debe pasar un parametro: $0 <nombre_directorio>"
fi

dir=$1

lec=$(find $dir -type f -perm -o=r | wc -l)
esc=$(find $dir -type f -perm -o=w | wc -l)
eje=$(find $dir -type f -perm -o=x | wc -l)

regulares=$(find $dir -type f | wc -l)
directorios=$(find $dir -type d | wc -l)
bloques=$(find $dir -type b | wc -l)

nolec=$(($regulares - $lec))
noesc=$(($regulares - $esc))
noeje=$(($regulares - $eje))
echo "Ficheros con permisos de lectura: $lec"
echo "Ficheros con permisos de escritura: $esc"
echo "Ficheros con permisos de ejecucion: $eje"
echo "Ficheros sin permisos de lectura: $nolec"
echo "Ficheros sin permisos de escritura: $noesc"
echo "Ficheros sin permisos de ejecucion: $noeje"
echo "Ficheros regulares: $regulares"
echo "Directorios: $directorios"
echo "Bloques: $bloques"
