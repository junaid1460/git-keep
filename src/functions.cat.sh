# show file data

showfile () {
    # $1 : filepath
    # $2 : commit
    filepath=$1
    message="$(cat $filepath)"
    colori $Yellow
    print $commit
    color $Off
    print $message
}