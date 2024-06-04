#!/bin/bash
function show_commands() {
    echo "Digite el numero del comando que desea realizar (ejemplo: 2): "
    echo "1. find <DIR> -name <FILENAME>* -type f -size +<SIZE>k | xargs -i rm -f {}"
    echo "2. find <DIR> -user <USERNAME>"
    echo "3. find <DIR> -type f -perm -o=r"
    echo "4. find <DIR> -type d ! -perm -070"
    echo "5. Salir"
}

function one() {
    local ruta=$1
    local nombre=$2
    local size=$3
    local files=""
    for line in $ruta/$nombre*
    do  
        if [ -e $line ] && [ $(du -k $line | cut -f1) -ge $size ]; then
            files="$files $line"
        fi
    done
    rm -f $files
}

function two() {
    local ruta=$1
    local usuario=$2
    local text=$(ls -l | tail -n +2)
    while read -r line
    do
        local usuario_texto=$(awk '{print $3}' <<< $line)
        if [[ "$usuario_texto" = "$usuario" ]]; then
            echo $(awk '{print $9}' <<< $line)
        fi
    done <<< $text
}

function three() {
    local ruta=$1
    local text=$(ls -l)
    while read -r line
    do 
        if [[ $(cut -c 8 <<< $line) == "r" ]]; then
            echo $(awk '{print $9}' <<< $line)
        fi
    done <<< $text
}

function four() {
    local ruta=$1
    local text=$(ls)
    while read -r line
    do
        if [ -d $line ] && [ $(stat -c %a $line) -ne 070 ]; then
            echo $line
        fi
    done <<< $text
}

while true
do
    show_commands
    read opc
    case $opc in
        1)
            read -p "Digite la ruta: " ruta
            read -p "Digite el nombre del archivo: " nombre
            read -p "Digite el size: " size
            one $ruta $nombre $size
            ;;
        2)
            read -p "Digite la ruta: " ruta
            read -p "Digite el nombre del usuario: " usuario
            two $ruta $usuario
            ;;
        3)
            read -p "Digite la ruta: " ruta
            three $ruta
            ;;
        4)
            read -p "Digite la ruta: " ruta
            four $ruta
            ;;
        5)
            echo Ejecucion finalizada
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            exit 1
            ;;
    esac
done


