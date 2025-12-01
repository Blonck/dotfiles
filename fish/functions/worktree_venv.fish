function worktree_venv --description "Create git worktree with venv copied from existing worktree"
    argparse 'b/create-branch' 'f/from=' 'i/install=' 'h/help' -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: worktree_venv [-b] [-f source] [-i cmd] <branch-name>"
        echo ""
        echo "Create a git worktree with a pre-configured Python venv."
        echo "Copies venv from an existing worktree and optionally runs install commands."
        echo ""
        echo "Options:"
        echo "  -b, --create-branch   Create new branch (default: checkout existing)"
        echo "  -f, --from <name>     Source worktree for venv copy (default: main)"
        echo "  -i, --install <cmd>   Run install command after venv copy (e.g., 'pip install -e .')"
        echo "  -h, --help            Show this help message"
        echo ""
        echo "Examples:"
        echo "  worktree_venv feature-xyz              # Checkout existing branch"
        echo "  worktree_venv -b my-new-feature        # Create and checkout new branch"
        echo "  worktree_venv -f dev feature-xyz       # Copy venv from 'dev' worktree"
        echo "  worktree_venv -i 'pip install -e .' f  # Run pip install after setup"
        return 0
    end

    if test (count $argv) -ne 1
        echo "Error: Exactly one branch name required"
        echo "Run 'worktree_venv --help' for usage"
        return 1
    end

    set -l branch_name $argv[1]

    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not in a git repository"
        return 1
    end

    # Detect base path for worktrees
    set -l git_common_dir (git rev-parse --git-common-dir 2>/dev/null)
    set -l base_path

    # Handle both main repo and worktree cases
    if string match -q "*/.git/worktrees/*" "$git_common_dir"
        set base_path (string replace -r '/\.git/worktrees/.*' '' "$git_common_dir")
        set base_path (dirname "$base_path")
    else if test "$git_common_dir" = ".git"
        set base_path (dirname (pwd))
    else
        set base_path (dirname (dirname "$git_common_dir"))
    end

    set -l target_path "$base_path/$branch_name"

    if test -d "$target_path"
        echo "Error: Directory already exists: $target_path"
        return 1
    end

    set -l source_name "main"
    if set -q _flag_from
        set source_name $_flag_from
    end

    set -l source_venv "$base_path/$source_name/.venv"

    if not test -d "$source_venv"
        echo "Error: Source venv not found: $source_venv"
        echo ""
        echo "Available worktrees:"
        git worktree list --porcelain | grep "^worktree " | sed 's/worktree /  /'
        return 1
    end

    if not set -q _flag_create_branch
        if not git rev-parse --verify "$branch_name" >/dev/null 2>&1
            if not git rev-parse --verify "origin/$branch_name" >/dev/null 2>&1
                echo "Error: Branch '$branch_name' does not exist"
                echo "Use -b to create a new branch"
                return 1
            end
        end
    end

    echo "Creating worktree for branch '$branch_name' at:"
    echo "  $target_path"
    echo ""

    if set -q _flag_create_branch
        git worktree add -b "$branch_name" "$target_path"
    else
        git worktree add "$target_path" "$branch_name"
    end

    if test $status -ne 0
        echo "Error: Failed to create worktree"
        return 1
    end

    echo ""
    echo "Copying venv from $source_name..."
    cp -a "$source_venv" "$target_path/.venv"

    if test $status -ne 0
        echo "Error: Failed to copy venv"
        git worktree remove "$target_path" 2>/dev/null
        return 1
    end

    set -l source_env "$base_path/$source_name/.env"
    if test -f "$source_env"
        echo "Copying .env from $source_name..."
        cp "$source_env" "$target_path/.env"
    end

    # Fix VIRTUAL_ENV paths in activate scripts
    set -l new_venv_path "$target_path/.venv"

    for activate_script in activate activate.fish activate.csh
        set -l script_path "$target_path/.venv/bin/$activate_script"
        if test -f "$script_path"
            sed -i "s|$source_venv|$new_venv_path|g" "$script_path"
        end
    end

    set -l exclude_file
    if test -f "$target_path/.git"
        set -l git_dir (string trim (cat "$target_path/.git" | string replace "gitdir: " ""))
        set exclude_file "$git_dir/info/exclude"
    else
        set exclude_file "$target_path/.git/info/exclude"
    end

    if test -f "$exclude_file"
        if not grep -q "^\.venv\$" "$exclude_file" 2>/dev/null
            echo ".venv" >> "$exclude_file"
        end
    end

    # Run custom install command if provided
    if set -q _flag_install
        echo ""
        echo "Running install command..."

        set -l original_dir (pwd)
        cd "$target_path"

        source "$target_path/.venv/bin/activate.fish"

        eval $_flag_install

        set -l install_status $status

        cd "$original_dir"

        if test $install_status -ne 0
            echo ""
            echo "Warning: Install command may have failed"
        end
    end

    echo ""
    echo "========================================="
    echo "Worktree created successfully!"
    echo "========================================="
    echo "  Location: $target_path"
    echo "  Branch:   $branch_name"
    echo "  Venv:     $target_path/.venv"
    echo ""
    echo "To start working, run:"
    echo "  cd $target_path"
    echo ""
    echo "(auto_venv will activate the venv automatically)"

    return 0
end
