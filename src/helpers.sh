color () {
    print "$1"
}

print () {
    # printf "$1" >> .tmp
    # printf $'\n' >> .tmp
    sh -c "echo '$@'"
}
