# List all informations

list_info () {
    messages="$(cat $file_info)"
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

# functions to add
# 1. list based on date
# 2. list first n, last n files
# 3. list i to j
# 4. display info of all listed data ( pipelining to internat cat function )