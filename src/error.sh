error () {
    
    color $Color_Off
    print "Usage : doc <repo> <option> [parameter]\n"
    print "Options :"
    print $Green"add\t\ta"$BWhite"\tAdd new file"
    # print $Green"undo\t\tu"$BWhite"\tUndo the last add"
    print $Green"list-files\tls"$BWhite"\tlist all stored files"
    print $Green"edit\t\te"$BWhite"\tedit files"
    print $Green"cat\t\t[None]"$BWhite"\tshow files"
    colori $White
    print "\nparameters :"
    print "1. edit/e <parameter>"
    print "\theader\tedit header file"
    print "\tfooter\tedit footer file"
    print "\t[0-9]+\tedit with file number (number should be from \"list-files\" option)"
    echo 
}
