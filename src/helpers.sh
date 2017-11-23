color () {
    print "$1"
}

colori () {
    sh -c "echo -n '$@'"
}

print () {
    # printf "$1" >> .tmp
    # printf $'\n' >> .tmp
    sh -c "echo '$@'"
}
