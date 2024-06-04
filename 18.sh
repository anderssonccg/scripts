#!/bin/bash
function file_count (){
    echo $(find . -type f | wc -l)
}

echo $(file_count)