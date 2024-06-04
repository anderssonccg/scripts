#!/bin/bash

mostrar_menu(){
        echo "Opciones:"
        echo "  grep    Buscar tu login en los directorios del sistema"
        echo "  pipes   Ver más opciones para listar diferentes elementos del sistema"
        echo "  Salir   Salir del menú" 
}

uso_de_grep(){
        read -p "Ingrese su nombre de usuario: " usuario
        grep -q "$usuario" /etc/passwd
        if [ $? -eq 0 ]; then
                echo "El usuario $usuario existe en /etc/passwd."
        else
                echo "El usuario $usuario no existe en /etc/passwd."
        fi

        grep -q "$usuario" /etc/shadow
        if [ $? -eq 0 ]; then
                echo "El usuario $usuario existe en /etc/shadow."
        else
                echo "El usuario $usuario no existe en /etc/shadow."
        fi

}

listBB(){
        etc=$(sort -t ":" -k3,3n /etc/passwd)
        echo "$etc" | grep "/bin/bash" | awk -F: '{print $1, $3 }'
}

pipes(){
        while true;
        do
                echo "  Sub-menu "Pipes":"
                echo "  listU   Listar en orden inverso todos los UID de los usuarios del sistema"
                echo "  listE   Listar el /etc/passwd, ordenado por GID"
                echo "  listEU  Listar el /etc/passwd ordenado por UID y por GID a la vez"
                echo "  listBB  Listar todos los usuarios con shell /bin/bash ordenados por UID"
                echo "  Salir   Volver al menu principal"

                read -p "Ingrese una opcion: " op
                case $op in
                        1 | listU)
                                cut -d: -f3 /etc/passwd | sort -n -r | tr '\n' ' '
                                ;;
                        2 | listE)
                                sort -t ":" -k 4 -n /etc/passwd
                                ;;
                        3 | listEU)
                                sort -t ":" -k 3,4 -n /etc/passwd
                                ;;
                        4 | listBB)
                                listBB
                                ;;
                        5 | [Ss][Aa][Ll][Ii][Rr])
                                break
                                ;;
                        *)
                                echo "Eso no es una opcion"
                                ;;
                esac
        done
}

while true; 
do
        mostrar_menu

        read -p "Ingrese una opción: " op
        case $op in
                1 | "grep")
                        uso_de_grep
                        ;;
                2 | "pipes")
                        pipes
                        ;;
                3 | [Ss][Aa][Ll][Ii][Rr])
                        break
                        ;;
                *)
                        ;;
        esac
done