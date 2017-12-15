# List all informations

list_info () {
    messages="$(cat $info_file)"
    count=0
    IFS=$'\n'
    for i in $messages;do
        colori $Green
        echo -n "[$count] "
        colori $Off
        IFS=, read -r file commit <<< "$i"
        echo $commit
        count=$(($count+1))
        IFS=$'\n'
    done
}
