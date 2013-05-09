# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' ${terminfo[smkx]}
    }
    function zle-line-finish () {
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-init
    zle -N zle-line-finish
else
    # ...
fi

autoload -U colors && colors
autoload -Uz compinit promptinit
compinit
promptinit
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob
unsetopt correct_all   #unset auto correction

bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

# End of lines added by compinstall
# own configurations
#
# completion menu with arrowkeys
zstyle ':completion:*' menu select
# arraowkeys -> history search
bindkey "${terminfo[kcuu1]}" up-line-or-search
bindkey "${terminfo[kcud1]}" down-line-or-search
# needed for color output
# define Prompt
PROMPT="%n@%m:%2~:[%?] "
RPROMPT="'%T-%D'"

# local aliases
alias ls='ls --color=auto -F'
alias lsa='ls -al'
alias lsh='ls -ld .*'
alias f='find |grep'
alias ..='cd ..'

# auto extension
alias -s html=$BROWSER
alias -s txt=$EDITOR
alias -s tex=$EDITOR
alias -s h=$EDITOR
alias -s cpp=$EDITOR
alias -s hpp=$EDITOR
alias -s pdf=evince
alias -s ps=evince

# command L equivalent to command |less
alias -g L='|less'

# local ENVIROMENTVARIABLES
export EDITOR="vim"
export BROWSER="firefox"
export PATH="$PATH:~/exe/"
export PATH="$PATH:~/bin/"
export PATH="$PATH:/usr/local/bin/"
