#!/bin/bash
# functions related to deleting a file

confirmDeletion () {
    commit=$2
    number=$3
    colori $Red 
    printi "Delete record "
    colori $Off
    print "$commit?"
}

deleteWithNumber () {
    number=$1
    callOnFile $number confirmDeletion "File not found!"
}