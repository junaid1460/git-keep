#!/bin/bash
# functions related to deleting a file

deleteFromInfo () {
    number=$1
    infos="$(cat $info_file)"
    echo -n '' > $info_file
    IFS=$'\n'
    count=0
    for line in $infos;do
        if [ "$count" != "$number" ]
        then
            echo $line
        fi
        count=$(($count + 1))
    done
} >> $info_file



confirmDeletion () {
    file=$file
    commit=$2
    number=$3
    colori $Red 
    printi "Delete record "
    colori $Off
    printi "$commit?[yN]"
    read choice
    if [ "$choice" == "y" ]
    then
        rm $files_dir/$file
        deleteFromInfo $number
        updateREADME "Deleted record: $commit."
    fi
}

deleteWithNumber () {
    number=$1
    callOnFile $number confirmDeletion "File not found!"
}