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

add () {
    edit
    show | less -r
    confirm
}
