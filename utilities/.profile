########################################################################################
#
#                            .oyhhs:          User: skg
#                  ..--.., shhhhhh-           Hostname: deploy
#                -+++++++++`:yyhhyo`          OS: Ubuntu 14.04 x64
#           .--  -++++++++/-.-::-`            Kernel: 3.8.0-29-generic
#         .::::-   :-----:/+++/++/.
#        -:::::-.          .:++++++:          Shell: Bash
#   ,,, .:::::-`             .++++++-         Terminal: 256 color
# ./+++/-`-::-                ./////:         Packages: unk
# +++++++ .::-
# ./+++/-`-::-                :yyyyyo
#   ``` `-::::-`             :yhhhhh:
#        -:::::-.         `-ohhhhhh+          // will make dynamic when have more time
#         .::::-` -o+///+oyhhyyyhy:
#          `.--  /yhhhhhhhy+,....
#                /hhhhhhhhh-.-:::;
#                `.:://::- -:::::;
#                          `.-:-'
#
########################################################################################

# ======================================================================================
#                                      Utilities
# ======================================================================================
alias ws='cd ~/code/_workspace'
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ls='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias reload="clear; source ~/.profile"     # reset changes in profile if edited
alias bsh="subl ~/.profile"

# ======================================================================================
#                                      History
# ======================================================================================
# History lists your previously entered commands
alias h='history'
# http://jorge.fbarr.net/2011/03/24/making-your-bash-history-more-efficient/
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ignore same sucessive entries.
export HISTCONTROL=ignoreboth



# *--------------Utility Funtions

man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# ======================================================================================
#                                        Networking
# ======================================================================================

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'
alias rogue='lsof -i TCP:3000'

# Start an HTTP server from a directory, optionally specifying the port

function server() {
  local port="${1:-9000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}


# ======================================================================================
#                                        Prompt
# ======================================================================================

# red braces on darkred text \ yellow directory \ and white text
# PS1="\[\033[0;31m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;31m\]\342\234\227\[\033[0;37\m\]]\342\224\200")[\[\033[01;31m\]\u\[\033[0;32m\]@\033[0;31m\h\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01m\]\$"

# White Format; Bold Pink/Red Name; Green/Yellow '@'; directory greenish
#PS1="\[\033[0;0m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;0m\]\342\234\227\[\033[0;37\m\]]\342\224\200")[\[\033[01;31m\]\u\[\033[0;32m\]@\033[0;0m\h\[\033[0;0m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;0m\]]\n\[\033[0;0m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01m\]\$"

# blue format; bold red/pink user; purple '@', greenish hostname; directory red and text is white
PS1="\[\033[0;34m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;32m\]\342\234\227\[\033[0;37\m\]]\342\224\200")[\[\033[01;35m\]\u\[\033[0;35m\]@\033[0;32m\h\[\033[0;34m\]]\342\224\200[\[\033[01;35m\]\w\[\033[0;34m\]]\n\[\033[0;34m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01m\]\$"

# same color as prompt above execpt with git aware if repo is properly loaded into ~
#PS1="\[\033[0;34m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;32m\]\342\234\227\[\033[0;37\m\]]\342\224\200")[\[\033[01;35m\]\u\[\033[0;35m\]@\033[0;32m\h\[\033[0;34m\]]\342\224\200[\[\033[01;35m\]\w\[\033[0;34m\] x\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]]\n\[\033[0;34m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01m\]\$"

# ======================================================================================
#                                        Config
# ======================================================================================

# Extra things can go here.

#----------------------
#     $PATH
# ---------------------

# This is how I would format it. Paths come last and
# can be added using  ` >> ~/.profile ` syntax.
