# workaround for ssh-agent and tmux, see
# https://gist.github.com/admackin/4507371

# run ssh-agent if none is running
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
fi

_ssh_auth_save() {
  ln -sf "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh-auth-sock.$HOSTNAME"
}
alias tmux='export HOSTNAME=$(hostname) ; _ssh_auth_save ; tmux'
