#!/bin/bash
# NOTA: se supone que se permite cualquier extension. Esto es muy facil de modificar pero me da pereza
read -p "¿Cuántos archivos quieres crear? " numero_archivos
read -p "¿Cuál será el nombre base de tu archivo? " nombre_archivo
read -p "¿Qué cadena de texto quieres poner en tus archivos? " cadena_texto

if [ -z "$numero_archivos" ] || [ -z "$cadena_texto" ] || [ -z "$nombre_archivo" ]; then
    echo "No proporcionaste alguna de las variables"
    exit 1
fi

nombre_archivo2=$(echo "$nombre_archivo" | tr -cd '[:alnum:]._-')

if [ -z "$nombre_archivo2" ]; then
    echo "El nombre base del archivo no es válido después de eliminar caracteres no válidos. Por favor, intenta de nuevo."
    exit 1
fi

x=$numero_archivos
while [ $x -gt 0 ]; do
    nuevo_nombre="${nombre_archivo2}_$x.txt"
    if [ -f "$nuevo_nombre" ]; then
        echo "$nuevo_nombre ya ha sido usado como nombre, intenta de nuevo"
        exit 1
    fi
    x=$((x - 1))
done

x=$numero_archivos
while [ $x -gt 0 ]; do
    nuevo_nombre="${nombre_archivo2}_$x.txt"
    echo "$cadena_texto" > "$nuevo_nombre"
    echo "Se ha creado el archivo $nuevo_nombre"
    x=$((x - 1))
done

echo "Todos los archivos han sido creados."