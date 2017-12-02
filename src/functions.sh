# This file has all functions for doc <repo> add

#edit files
edit () {
    eval $editor $info_temp_file
    eval $editor $commit_temp_file
}

# Show summary
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

# write content to new file and commit
commit () {
    message="$(get_commit_message)"
    newfile="$(get_newfile_name $message)"
    data="$(cat $info_temp_file)"
    echo "$newfile,$message" >> "$info_file"
    echo $data > "$files_dir/$newfile"
    git add "$files_dir/$newfile"
    git commit -m "[$newfile] $message"
}

# generate new file name which does not exist under <repo>/files
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

# ask for confirmation
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


# Checking whether commit message is empty or not
get_commit_message () {
    message="$(cat $commit_temp_file)"
    if [ "$message" == "" ]
    then
        message="On $(date)"
    fi
    echo $message
}

# Confirm after edit
confirm () {
    ask #ask what to do 
    commit #commit changes
    show
}

# Delete temp file
delete_temp () {
    rm  $info_temp_file
    rm  $commit_temp_file
}

# Create required temp file
create_temp () {
    touch $info_temp_file
    touch $commit_temp_file
}

# Entry point
add () {

    # avoid reading oldfile
    create_temp
    delete_temp
    create_temp

    # edit and show with color in less
    edit
    show | less -r

    # confirm with content
    confirm

    # update readme file
    updateREADME

    #delete temporary file
    delete_temp
}
