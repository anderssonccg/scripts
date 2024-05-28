#!/bin/bash
while true; do
        echo "Listar archivo: -l"
        echo "Quien esta conectado: -q"
        echo "Fecha actual: -f"
        echo "Quien soy: -w"
        echo "Calendario: -c"
        echo "Nombre maquina: -m"
        echo "Salir: -e"

        read opc
        case $opc in
                "-l")
                        read -p "Digita la ruta del fichero o directorio: " file
                        if [ -d $file ]; then
                                ls $file
                        elif [ -f $file ];then
                                cat $file
                        fi
                        ;;
                "-q")
                        who
                        ;;
                "-f")
                        date
                        ;;
                "-w")
                        whoami
                        ;;
                "-c")
                        cal
                        ;;
                "-m")
                        hostname
                        ;;
                "-e")
                        exit 0
                        ;;
                *)
                        echo "Opcion invalida"
                        ;;
        esac
        echo
done