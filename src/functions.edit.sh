# edit file with number

updateInfoFile () { # filenumber, commitmessage, filename
    number=$1
    commit=$2
    file=$3
    messages="$(cat $info_file)"
    IFS=$'\n'
    count=0
    rm $info_file
    for line in $messages;do
        if [ "$count" == "$number" ]
        then
            echo "$file,$commit" >> $info_file
        else
            echo "$line" >> $info_file
        fi
        count=$(($count + 1))
    done
}

editThis () { # filename, commitmessage, filenumber
    file=$1
    commit=$2
    number=$3
    edit "$files_dir/$file"
    echo $commit > $commit_temp_file
    edit $commit_temp_file
    newcommit="$(cat $commit_temp_file)"
    updateInfoFile $number $newcommit $file
    rm $commit_temp_file
    commit? "Altered file : $commit"
}


editWithNumber () {
    number=$1
    callOnFile $number editThis "File not found!"
}

