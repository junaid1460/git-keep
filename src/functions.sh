undo () {
    git reset HEAD~1
    git stash
}

edit () {
    eval $editor $info_temp_file
    eval $editor $commit_temp_file
}

show () {
    color $Green
    print "Information : "
    color $Off
    echo "$(cat $info_temp_file)"
    color $Yellow
    print "Commit message : "
    color $Off
    echo "$(cat $commit_temp_file)"
    color $Off
}

commit () {
    message="$(get_commit_message)"
    newfile="$(get_newfile_name $message)"
    data="$(cat $info_temp_file)"
    echo $data > "$files_dir/$newfile"
    git add "$files_dir/$newfile"
    git commit -m "[$newfile] $message"
}

get_newfile_name () {
    # $1: commit message
    # $files_dir => global var
    message=$1
    rand="$(date +%s%N)"
    newfile="$(echo -n $rand$message$RANDOM | base64).md"
    while [ -f "$files_dir/$newfile" ];do 
        rand="$(date +%s%N)"
        newfile="$(echo -n $rand$message$RANDOM | base64).md"
    done
    printf $newfile
}

ask () {
    echo  -ne "commit or edit [Ce]?" 
    read opt
    if [ "$opt" == "e" ]
    then
        echo -e "\e[1A\r                                  \e[1A\r"
        add  
        return     
    fi
}

verify_requirements () {
    if [ ! -d "$files_dir" ]
    then
        mkdir $files_dir
    fi
    if [ ! -f "README.md" ]
    then
        echo "# Logs" >> README.md
    fi
}

get_commit_message () {
    message="$(cat $commit_temp_file)"
    if [ "$message" == "" ]
    then
        message="On $(date)"
    fi
    echo $message
}

confirm () {
    ask #ask what to do 
    verify_requirements #verfiy that all required files/dir are there
    commit #commit changes
    show
}

delete_temp () {
    rm  $info_temp_file
    rm  $commit_temp_file
}

create_temp () {
    touch $info_temp_file
    touch $commit_temp_file
}

add () {
    create_temp
    delete_temp
    create_temp

    # edit
    # show | less -r
    confirm

    delete_temp
}
