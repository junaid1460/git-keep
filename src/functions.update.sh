# after every changes update readme file

writeheader () {
    out=$1
    echo "$(cat $header_file)" 
} > $readmefile

writefooter () {
    out=$1
    echo "$(cat $footer_file)" 
} >> $readmefile

writeInfoAsLinks () {
    out=$1
    file="$(cat $info_file)"
    IFS=$'\n'
    for line in $file;do
        IFS=, read -r file commit <<< "$line"
        echo " - [$commit](files/$file)" 
    done
} >> $readmefile

updateREADME () {
    # header
    writeheader
    # content
    writeInfoAsLinks 
    # footer
    writefooter
    # commit
    commit? $1
}