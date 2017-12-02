# after every changes update readme file

getheader () {
    echo "# My files"
    echo ""
}

getfooter () {
    echo "# License"
    echo "MIT"
}

updateREADME () {
    # header
    header="$(getheader)"
    
    # footer
    footer="$(getfooter)"
}