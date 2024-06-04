function bin_to_dec() {
    local x=$1
    local exp=1
    local answer=0
    local dig=0
    while [ $x -ne 0 ]
    do
        dig=$(($x % 10))
        answer=$(($answer + $(($dig * $exp))))
        exp=$(($exp * 2))
        x=$(($x / 10))
    done
    echo "El numero convertido a decimal es: $answer"
}

function dec_to_bin() {
    local x=$1
    local answer=""
    while [ $x -ne 0 ]
    do
        dig=$(($x % 2))
        answer="$dig$answer"
        x=$(($x / 2))
    done
    echo "El numero convertido a binario es: $answer"
}


while true;
do
    echo "1. Binario a decimal"
    echo "2. Decimal a binario"
    echo "3. Salir"

    read opc
    case $opc in
        1)
            read -p "Digite el numero: " num
            bin_to_dec $num
            ;;
        2)
            read -p "Digite el numero: " num
            dec_to_bin $num
            ;;
        3)
            echo "Bye bye"
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            ;;
    esac
done