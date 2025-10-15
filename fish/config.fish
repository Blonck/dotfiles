source ~/.config/fish/conf.d/generic.fish

set -x EDITOR nvim

fish_add_path $HOME/local/bin/
fish_add_path $HOME/.local/bin/
fish_add_path $HOME/.cargo/bin/

# fixed socket for ssh auth
if test -S "$SSH_AUTH_SOCK"; and not test -L "$SSH_AUTH_SOCK"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
end
set -x SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock


function venv --description "Create and activate a new virtual environment"
    if test -e .venv
        echo "Activating virtual environment in "(pwd)"/.venv"
        source .venv/bin/activate.fish
    else
        echo "Creating virtual environment in "(pwd)"/.venv"
        python3 -m venv .venv --upgrade-deps
        source .venv/bin/activate.fish

        # Append .venv to the Git exclude file, but only if it's not
        # already there.
        if test -e .git
            set line_to_append ".venv"
            set target_file ".git/info/exclude"

            if not grep --quiet --fixed-strings --line-regexp "$line_to_append" "$target_file" 2>/dev/null
                echo "$line_to_append" >> "$target_file"
            end
        end
    end
end

function auto_venv --on-variable PWD --description "Auto activate/deactivate venv"
    # Check if we're in a virtual environment
    if set -q VIRTUAL_ENV
        # Get the venv directory
        set venv_dir (dirname (dirname $VIRTUAL_ENV))

        # Check if we've left the venv directory tree
        if not string match -q "$venv_dir*" $PWD
            deactivate
            echo "Deactivated virtual environment"
        end
    end

    # Check if current directory or any parent has .venv
    set current_dir $PWD
    while test "$current_dir" != "/"
        if test -e "$current_dir/.venv/bin/activate.fish"
            # Only activate if not already in this venv
            if not set -q VIRTUAL_ENV; or test "$VIRTUAL_ENV" != "$current_dir/.venv"
                source "$current_dir/.venv/bin/activate.fish"
                echo "Activated virtual environment in $current_dir/.venv"
            end
            return
        end
        set current_dir (dirname $current_dir)
    end
end

# trigger auto_venv for new shell in case we open the shell directly in a venv dir
auto_venv

function mamba_shell --description "Initialize fish shell to use mamba"
    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba shell init' !!
    set -gx MAMBA_EXE "/home/martin/local/miniforge3/bin/mamba"
    set -gx MAMBA_ROOT_PREFIX "/home/martin/local/miniforge3"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<
end
