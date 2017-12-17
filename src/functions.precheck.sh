# Checking whether all requirements satisfied or not
verify_requirements () {
    if [ ! -d "$files_dir" ]
    then
        mkdir $files_dir
    fi
    if [ ! -f "README.md" ]
    then
        echo "# Logs" >> README.md
    fi
    if [ ! -f "$info_file" ]
    then
        touch "$info_file"
    fi
    if [ ! -f "$footer_file" ]
    then
        touch "$footer_file"
    fi
    if [ ! -f "$header_file" ]
    then
        touch "$header_file"
    fi
    if [ ! -f "$gitignore_file" ]
    then
        touch "$gitignore_file"
        echo "$info_temp_name" >> $gitignore_file
        echo "$commit_temp_name" >> $gitignore_file
        echo "*.save" >> $gitignore_file
        echo "*.swp" >> $gitignore_file
    fi

    commit? "Created requirements!"
}