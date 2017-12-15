# show file data

showfile () {
    # $1 : file
    # $2 : commit
    filepath=$1
    # message="$()"
    colori $Yellow
    print $commit
    color $Off
    # echo $message
    cat $files_dir/$file
}

showFileWithNumber () {
    number=$1
    messages="$(cat $info_file)"
    count=0
    IFS=$'\n'
    for i in $messages;do
        IFS=, read -r file commit <<< "$i"
        if [ "$count" == "$number" ]
        then 
            showfile $file $commit
            return
        fi
        count=$(($count+1))
        IFS=$'\n'
    done
}