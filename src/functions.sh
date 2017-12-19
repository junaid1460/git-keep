# This file has all functions for doc <repo> add

#edit files
edit () {
    current_file=$1
    eval $editor $current_file
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
write () {
    message="$(get_commit_message)"
    newfile="$(get_newfile_name $message)"
    echo "$newfile,$message" >> "$info_file"
    mv $info_temp_file "$files_dir/$newfile"
    touch $info_temp_file # avoid error while deleting file
    commit? "$1 $message"
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
    else
        message="$message ($(date))"
    fi
    echo $message
}

# Confirm after edit
confirm () {
    ask #ask what to do 
    write "C :"#commit changes
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
    edit $info_temp_file
    edit $commit_temp_file
    show | less -r

    # confirm with content
    confirm

    # update readme file
    updateREADME
    commit? "Updated README.md"
    #delete temporary file
    delete_temp
}
