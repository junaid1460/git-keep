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
    echo "nothing"
}


confirm () {
    echo  -ne "commit or edit [Ce]?" 
    read opt
    if [ "$opt" == "e" ]
    then
        echo -e "\e[1A\r                                  \e[1A\r"
        add  
        return     
    fi
    show
    echo -e "\e[1A\r"
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

    edit
    show | less -r
    confirm

    delete_temp
}
