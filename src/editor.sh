if [ "$(hash nano)" == "" ]
then
    editor="vim"
elif [ "$(hash vim)" == "" ]
then
    editor="vi"
elif [ "$(hash vi)" == "" ]
then
    editor="nano"
else
    editor="cat>"
fi
export editor