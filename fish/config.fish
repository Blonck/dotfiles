source ~/.config/fish/conf.d/cachyos-config.fish

set -x EDITOR nvim

fish_add_path ~/local/bin/
fish_add_path $HOME/.local/bin

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

function mamba_shell --description "Initialize fish shell to use mamba"
    # >>> mamba initialize >>>
    # !! Contents within this block are managed by 'mamba shell init' !!
    set -gx MAMBA_EXE "/home/martin/local/miniforge3/bin/mamba"
    set -gx MAMBA_ROOT_PREFIX "/home/martin/local/miniforge3"
    $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
    # <<< mamba initialize <<<
end
