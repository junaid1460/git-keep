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
