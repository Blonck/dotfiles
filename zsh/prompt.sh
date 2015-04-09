# define Prompt
PROMPT="%n@%m:%2~:[%?]"
RPROMPT="'%T-%D'"

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} ${git_custom_status} $EPS1 ${RPROMPT}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

