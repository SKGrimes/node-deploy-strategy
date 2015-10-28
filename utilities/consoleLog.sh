#usage: consoleLog 'Hello World'
consoleLog()
{
    echo '['$(date +'%a %Y-%m-%d %H:%M:%S %z')']' $1
}

#usage:
#setValue 'Enter something' 'defaultValue'
#VAR=$NEW_VALUE
setValue()
{
    read -p "$1 ("$2"): " NEW_VALUE
    if [ -z $NEW_VALUE ]; then
        NEW_VALUE=$2
    fi
}
