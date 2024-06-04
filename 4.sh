#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Debe pasar dos parametros: $0 <numero de archivos> <linea a escribir>"
    exit 1
fi

contador=1
limite=$1
text=$2

while [ $contador -le $limite ]
do
    file_name="file_$contador.txt"
    touch $file_name
    echo $text > $file_name  
    contador=$(( $contador + 1 ))
done

echo "Se crearon $limite archivos: "
ls *.txt