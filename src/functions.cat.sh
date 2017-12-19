# show file data

showfile () {
    # $1 : file
    # $2 : commit
    file=$1
    commit=$2
    colori $Yellow
    print $commit
    color $Off
    # echo $message
    cat $files_dir/$file
}

showFileWithNumber () {
    number=$1
    callOnFile $number showfile "File not found!"
}