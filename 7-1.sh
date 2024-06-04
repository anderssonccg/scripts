show_options() {
    echo "-todo     Hacer un backup de los archivos con cierta extension"
    echo "-cuenta   Contar los ficheros con una cierta extension"
    echo "-cuentad  Contar los directorios existentes"
    echo "-tc       Realizar -todo y -cuenta al tiempo"
    echo "-q        Salir"
}

todo() {
    local extension=$1
    if ! [ -d "backup" ]
    then
        mkdir backup
    fi
    cp *.$extension backup 2>/dev/null
    if [ $? -ne 0 ]; then
        echo -e "\nNo existen ficheros con esa extension\n"
    else
        echo -e "\nSe han copiado los archivos al directorio backup\n"
        tree backup/    
    fi
}

cuenta() {
    local extension=$1
    count=$(find . -name "*.$extension" | wc -l)
    echo -e "\nHay $count archivos con la extension .$extension\n"
}

cuentad() {
    local count=$(find . -type d | wc -w)
    count=$(($count - 1))
    echo -e "\nHay $count directorios\n"
}

while true
do
    show_options
    read -p "Digite la opcion a realizar: " opc
    case $opc in
        "-todo")
            read -p "Digite la extension: " ext
            todo $ext
            ;;
        "-cuenta")
            read -p "Digite la extension: " ext
            cuenta $ext
            ;;
        "-cuentad")
            cuentad
            ;;
        "-tc")
            read -p "Digite la extension: " ext
            cuenta $ext
            cuentad
            ;;
        "-q")
            echo Bye bye
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            ;;
    esac
done