for config_file in ~/.zsh/host/$(hostname).sh
do
  source ${config_file}
done

for config_file in ~/.zsh/host/$(hostname -d).sh
do
  source ${config_file}
done
