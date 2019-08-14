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

disk-uuid() {
    [[ -z $1 ]] && echo "Must pass an argument" && return 1
    echo $(sudo blkid $1 -sUUID -ovalue)
}

_autoload_custom ~/.zsh-functions
_autoload_custom ~/.zsh-local-functions

setopt rmstarwait
setopt autonamedirs
setopt noclobber
setopt appendcreate

# Java
JAVA_HOME=/opt/java/jdk-8-latest
if [[ -d $JAVA_HOME ]]; then
    export JAVA_HOME
    path=($JAVA_HOME/bin $path)
fi

# MAVEN
M2_HOME=/opt/apache-maven/latest
if [[ -d $M2_HOME ]]; then
    export M2_HOME
    path=($M2_HOME/bin $path)
fi

## SBT
SBT_HOME=/opt/sbt/latest
if [[ -d $SBT_HOME ]]; then
    export SBT_HOME
    path=($SBT_HOME/bin $path)
fi

# GO
typeset -xg GOPATH=/repositories/go
path+=(/usr/local/go/latest/bin)
path+=($GOPATH/bin)

# Kubernetes
typeset -xTU KUBECONFIG kubeconfig
kubeconfig=(~/.kube/*(.))

# PIP
path+=(/home/acunsolo/.local/bin)
disk-uuid() {
    [[ -z $1 ]] && echo "Must pass an argument" && return 1
    echo $(sudo blkid $1 -sUUID -ovalue)
}

#VS Code
path=(~/opt/VSCode/latest/bin/ $path)
repos=/repositories  

# Aliases
alias grep='grep --color=auto'
alias cp='cp -i --reflink=auto'
alias mv='mv -i'
alias rm='rm -i'
alias sysdreload='systemctl --user daemon-reload'
alias find='noglob find'
alias sudo='sudo '

