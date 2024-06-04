#!/bin/bash

echo "Directorio actual: $(pwd)"
ficheros=$(ls -1 | tr '\n' ' ' )
echo "Ficheros: $ficheros"

for fichero in *
do
        permisos=$(stat -c "%A" "$fichero")
        lectura=$(echo "$permisos" | grep -o "r" | wc -l)
        escritura=$(echo "$permisos" | grep -o "w" | wc -l)
        ejecucion=$(echo "$permisos" | grep -o "x" | wc -l)
        echo "$(stat -c "%n" "$fichero") $(stat -c "%A" "$fichero")"
        echo "Permisos de lectura   : $lectura"
        echo "Permisos de escritura : $escritura"
        echo "Permisos de ejecuciona: $ejecucion"
        if [ -d "$fichero"  ]; then
                echo "Directorio: Si"
        else
                echo "Directorio: No"
        fi

        if [ "$lectura" -eq 0  ]; then
                chmod +r "$fichero"
                chmod g-x "$fichero"
                echo "Se le ha asignado permisos de lectura y se han quito permisos de ejecucion para el grupo al fichero $fichero"     
        fi
        echo
done

