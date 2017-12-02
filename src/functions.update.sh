# after every changes update readme file

getheader () {
    echo "# My files"
    echo ""
}

getfooter () {
    echo "# License"
    echo "MIT"
}

printInfoAsLinks () {
    file="$(cat $info_file)"
    IFS=$'\n'
    for line in $file;do
        IFS=, read -r file commit <<< "$line"
        echo " - [$commit]($files_dir/$file)"
    done
}

updateREADME () {
    # header
    header="$(getheader)"
    echo $header > $readmefile
    # content
    content="$(printInfoAsLinks)"
    echo $content >> $readmefile

    # footer
    footer="$(getfooter)"
    echo $footer >> $readmefile
}