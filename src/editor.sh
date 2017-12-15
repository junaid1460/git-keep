if [ "$(hash nano)" == "" ]
then
    editor="nano"
elif [ "$(hash vim)" == "" ]
then
    editor="vim"
elif [ "$(hash vi)" == "" ]
then
    editor="vi"
else
    echo "no text editors found!(nano, vim, vi)"
    exit
fi
export editor