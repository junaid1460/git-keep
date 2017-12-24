# show file data

showfile () {
    # $1 : file
    # $2 : commit

    file=$1
    commit=$2
    color $Green
    print +++
    colori $Yellow
    if [ "$3" == "1" ]
    then
        cat "$2"
    else
        print $commit
    fi
    color $Off
    # echo $message
    cat $files_dir/$file
    colori $Green
    print +++
    color $Off
}

showFileWithNumber () {
    number=$1
    callOnFile $number showfile "File not found!"
}