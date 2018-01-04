if [ "$(command -v nano)" != "" ]
then
    editor="nano"
elif [ "$(command -v vim)" != "" ]
then
    editor="vim"
elif [ "$(command -v vi)" != "" ]
then
    editor="vi"
else
    echo "no text editors found!(nano, vim, vi)"
    exit
fi
export editor