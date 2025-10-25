# dotfiles

Personal configuration files for development tools and shell environments.

## Contents

- **Shells**: fish, zsh
- **Editors**: neovim, vim
- **Tools**: tmux, git, ssh, gnuplot

## Installation

```bash
./install.sh
```

This creates symlinks from the repository to their target locations (defined in `config.list`).

- **Neovim**: LSP setup with Mason, Telescope fuzzy finder, Treesitter, Git integration
- **Fish**: Auto-activating Python venv, platform-specific configs, Mamba support
