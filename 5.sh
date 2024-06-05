#!/bin/bash
lec=0
esc=0
eje=0
directorios=0
for file in $(ls)
do
    if [ -d $file ]; then
        directorios=$(($directorios + 1))
    fi
    if [ -r $file ]; then
        lec=$(($lec + 1))
    fi
    if [ -w $file ]; then
        esc=$(($esc + 1))
    fi
    if [ -x $file ]; then
        eje=$(($eje + 1))
    fi
done

echo "Lectura: $lec"
echo "Escritura: $esc"
echo "Ejecucion: $eje"
echo "Directorios: $directorios"