PATH="$HOME/local/bin:$HOME/.cargo/bin/:$HOME/local/julia-1.1.1/bin:$PATH"

use_conda ()
{
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/marenz/local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/marenz/local/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/home/marenz/local/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/marenz/local/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}
