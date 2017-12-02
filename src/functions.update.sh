# after every changes update readme file

writeheader () {
    out=$1
    echo "$(cat $header_file)" >> $out
}

writefooter () {
    out=$1
    echo "$(cat $footer_file)" >> $out
}

writeInfoAsLinks () {
    out=$1
    file="$(cat $info_file)"
    IFS=$'\n'
    for line in $file;do
        IFS=, read -r file commit <<< "$line"
        echo " - [$commit](files/$file)" >> $out
    done
}

updateREADME () {
    # clear file
    echo -n '' > $readmefile
    # header
    writeheader $readmefile
    # content
    writeInfoAsLinks $readmefile
    # footer
    writefooter $readmefile
}