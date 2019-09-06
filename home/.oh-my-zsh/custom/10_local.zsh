## Memory overview
memusage() {
    ps aux | awk '{if (NR > 1) print $5;
                   if (NR > 2) print "+"}
                   END { print "p" }' | dc
}

_autoload_custom() {
    if [[ -d $1 ]]; then
        local -a f
        # ^/ Not directories
        # N -> Set NULL_GLOB
        # D -> Set DOT_GLOB
        # :A -> realpath (follow symlinks)
        f=( $1/*(^/ND:A) )
        [[ $#f -ne 0 ]] && autoload -Uz $f
    fi
}

_autoload_custom ~/.zsh-functions
_autoload_custom ~/.zsh-local-functions

setopt rmstarwait
setopt autonamedirs
setopt noclobber
setopt appendcreate

alias grep='grep --color=auto'
alias cp='cp -i --reflink=auto'
alias mv='mv -i'
alias rm='rm -i'
alias sysdreload='systemctl --user daemon-reload'
alias find='noglob find'
alias sudo='sudo '

