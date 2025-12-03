## Load common configuration (shared across all platforms)
source ~/.config/fish/conf.d/common.fish

## Detect platform and load platform-specific configuration
if test -f /etc/os-release
    set -l os_id (grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

    if test "$os_id" = "cachyos"
        # Load CachyOS-specific configuration
        source ~/.config/fish/conf.d/platform-cachyos.fish
    end
end

## Custom settings and functions
set -x EDITOR nvim

fish_add_path $HOME/local/bin/
fish_add_path $HOME/.local/bin/
#fish_add_path $HOME/.cargo/bin/

# fixed socket for ssh auth
if test -S "$SSH_AUTH_SOCK"; and not test -L "$SSH_AUTH_SOCK"
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
end
set -x SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock


function init_conda
    source /home/martin/local/miniforge3/etc/fish/conf.d/conda.fish
end

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

function devtab --description "Open a zellij dev tab with 1 left + 2 stacked right panes"
    if not set -q ZELLIJ
        echo "Error: Not running inside a zellij session"
        return 1
    end

    if test (count $argv) -eq 0
        set target_path (pwd)
    else
        set target_path (realpath $argv[1])
    end

    if not test -d "$target_path"
        echo "Error: '$target_path' is not a directory"
        return 1
    end

    set tab_name (basename $target_path)
    zellij action new-tab --layout dev --name "$tab_name" --cwd "$target_path"
end

function mamba_shell --description "Initialize fish shell to use mamba"
    
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/home/martin/local/miniforge3/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/home/martin/.local/share/mamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
end
