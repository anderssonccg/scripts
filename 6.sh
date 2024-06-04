#!/bin/bash
while true
do
        echo "1. Comando grep"
        echo "2. Redirectores, tuberias y filtros"
        echo "3. Salir"
        read opc
        case $opc in
                1)
                        read -p "Digita el usuario: " user
                        first=$(grep $user /etc/passwd)
                        second=$(grep $user /etc/passwd)
                        if [ -z $first ] && [ -z $second ]; then
                                echo "El usuario no existe en el sistema"
                        else
                                echo "El usuario si existe en el sistema"
                        fi
                        ;;
                2)
                        echo "  2.1 Listar en orden inverso todos los UID de los usuarios del sistema"
                        echo "  2.2 Listar el /etc/passwd, ordenado por GID"
                        echo "  2.3 Listar el /etc/passwd ordenado por UID y por GID a la vez"
                        echo "  2.4 Listar todos los usuarios con shell /bin/bash ordenados por UID"
                        echo "  2.5 Salir al menu principal"
                        read opc_two
                        case $opc_two in
                                1)
                                        echo "Mostrando UID de usuarios ordenados de forma inversa:"
                                        cat /etc/passwd | cut -d ":" -f3 | sort -rn
                                        ;;
                                2)
                                        sort -t ":" -k 4 -n /etc/passwd
                                        ;;
                                3)
                                        sort -t ":" -k 3,4 -n /etc/passwd
                                        ;;
                                4)
                                        text=$(cat /etc/passwd)
                                        text2=""
                                        for line in $text
                                        do
                                                var=$(cut -d ":" -f7 <<< $line)
                                                if [ "$var" = "/bin/bash" ]; then
                                                        text2="$text2 $line\n"
                                                        #echo $line
                                                fi
                                        done
                                        echo -e $text2
                                        ;;
                                5)
                                        continue
                                        ;;
                        esac
                        ;;
                3)
                        echo "Seguro que quieres salir? (yes/no) "
                        read answer
                        if [ "$answer" = "yes" ]; then
                                exit 0
                        fi
                        ;;
        esac
done
