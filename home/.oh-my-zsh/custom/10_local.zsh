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
if [[ -d /usr/local/go ]]; then
    if [[ -d /repositories/go ]]; then
        GOPATH=/repositories/go
        export GOPATH
    fi
    path=(/usr/local/go/bin $GOPATH/bin $path)
fi

# Kubernetes
typeset -xTU KUBECONFIG kubeconfig
kubeconfig=(~/.kube/*(.))

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

