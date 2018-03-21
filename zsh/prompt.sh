# define Prompt

# taken from https://gist.github.com/bamanzi/5875262
_git_repo_name() { 
    gittopdir=$(git rev-parse --git-dir 2> /dev/null)
    if [[ "foo$gittopdir" == "foo.git" ]]; then
        echo `basename $(pwd)`
    elif [[ "foo$gittopdir" != "foo" ]]; then
        echo `dirname $gittopdir | xargs basename`
    fi
}

_git_branch_name() {    
    git branch 2>/dev/null | awk '/^\*/ { print $2 }'
}    

_git_is_dirty() { 
   git diff --quiet 2> /dev/null || echo '*'
}

autoload -U colors
colors
setopt prompt_subst

PROMPT="%n@%m:%2~:[%?]"
RPROMPT='$(_git_repo_name) $(_git_branch_name) $(_git_is_dirty)'



function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} ${git_custom_status} $EPS1 ${RPROMPT}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

