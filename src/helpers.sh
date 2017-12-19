color () {
    print "$1"
}

colori () { #inline color
    sh -c "echo -n '$@'"
}

print () {
    sh -c "echo '$@'"
}

printi () { #inline print
    sh -c "echo -n '$@'"
}

commit? () {
    if [ ! -d '.git' ]
    then
        echo "Repo not initialized"
        return
    fi
    message="$1"
    tmp="$(git status -s)"
    if [ ! "$tmp" == '' ]
    then
        git add .
        git commit -m "$message"
        echo "committed chages"
    fi
}

getFile () {
    number=$1
    export currentCommit='None'
    export currentFile='None'
    messages="$(cat $info_file)"
    count=0
    IFS=$'\n'
    for i in $messages;do
        IFS=, read -r file commit <<< "$i"
        if [ "$count" == "$number" ]
        then 
            export currentFile=$file
            export currentCommit=$commit
            return
        fi
        count=$(($count+1))
        IFS=$'\n'
    done
}

callOnFile () {
    # $1 : filenumber
    # $2 : func name
    # $3 : error message
    number=$1
    func=$2
    errorMessage=$3
    getFile $number
    if [ "$currentFile" == "None" ]
    then
        colori $Red
        print "$errorMessage"
    else
        $func $currentFile $currentCommit $number
    fi
}