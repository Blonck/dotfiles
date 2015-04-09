autoload -U colors && colors
autoload -Uz compinit promptinit

compinit -i
promptinit

source ~/.zsh/*.sh
source ~/.zsh/*.zsh
source ~/.zsh/opp/*.zsh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=50000
SAVEHIST=50000

# vim mode
bindkey -d
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

# End of lines added by compinstall
# own configurations
#
# completion menu with arrowkeys
zstyle ':completion:*' menu select
# 
# arraowkeys -> history search
bindkey "${terminfo[kcuu1]}" up-line-or-search
bindkey "${terminfo[kcud1]}" down-line-or-search

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
