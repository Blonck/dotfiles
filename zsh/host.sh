if [ -f  ~/.zsh/host/$(hostname).sh ]
then
  source ~/.zsh/host/$(hostname).sh
fi

if [ -f ~/.zsh/host/$(hostname -d).sh ]
then
  source ~/.zsh/host/$(hostname -d).sh
fi
