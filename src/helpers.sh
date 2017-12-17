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