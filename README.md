# Dotfiles

My personal configuration files managed with GNU Stow.

## Quick Start

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/jacobkvela/dotfiles/main/install.sh | bash
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/jacobkvela/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install GNU Stow if needed
sudo pacman -S stow  # Arch
# sudo apt install stow  # Debian/Ubuntu

# Install all dotfiles
stow *

# Or install specific packages
stow bash git tmux vim
```

## What's Included

### Core
- **bash** - Shell configuration, aliases, and prompt
- **git** - Git configuration and aliases
- **vim** - Vim configuration with plugins

### Terminal
- **tmux** - Terminal multiplexer config (Ctrl+Space prefix)
- **fish** - Fish shell configuration (optional)

### Utilities
- **bat** - Better cat with syntax highlighting
- **htop** - System monitor customization
- **ncmpcpp** - Music player UI

### Music
- **mpd** - Music Player Daemon configuration
- **mpv** - Video player settings

## Structure

```
~/.dotfiles/
├── bash/
│   ├── .bashrc
│   ├── .bash_profile
│   └── .bash_aliases
├── git/
│   └── .gitconfig
├── tmux/
│   └── .config/
│       └── tmux/
│           └── tmux.conf
├── vim/
│   └── .vimrc
└── ... (other packages)
```

Each package directory mirrors the structure from your home directory.

## Post-Install

### Install Vim Plugins

```bash
# Vim-plug will auto-install, then:
vim +PlugInstall +qall
```

### Install Tmux Plugins

```bash
# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# In tmux, press: Ctrl+Space I (capital i)
```

### Install Fish Plugins (Optional)

```bash
# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install recommended plugins
fisher install jethrokuan/z
fisher install IlanCosman/tide
```

## Key Features

### Bash Aliases

```bash
# Navigation
..          # cd ..
...         # cd ../..

# Git shortcuts
gst         # git status
ga          # git add
gc          # git commit -m
gp          # git push
gl          # git log (pretty)

# Dotfiles management
dotfiles    # cd ~/.dotfiles
dotpush     # Quick commit and push
dotstatus   # git status in dotfiles

# System (Arch)
install     # sudo pacman -S
update      # sudo pacman -Syy
upgrade     # sudo pacman -Syu

# Tmux
t           # tmux
ta          # tmux attach -t
tn          # tmux new -s
```

### Tmux Keybindings

**Prefix:** `Ctrl+Space`

```bash
# Window management
Ctrl+Space c        # New window
Ctrl+Space n/p      # Next/Previous window
Ctrl+Space ,        # Rename window

# Pane management
Ctrl+Space \        # Split vertically
Ctrl+Space -        # Split horizontally
Ctrl+Space h/j/k/l  # Resize panes
Ctrl+Space m        # Maximize/unmaximize pane
Ctrl+Space arrows   # Navigate panes

# Special
Ctrl+Space M        # ncmpcpp popup
Ctrl+Space r        # Reload config
```

### Vim Keybindings

**Leader:** `Space`

```bash
# File navigation
Space f      # Find files (FZF)
Space b      # Browse buffers
Space g      # Search in files (ripgrep)
Space n      # Toggle NERDTree

# Utilities
Space Space  # Clear search highlight
Space w      # Quick save
Space q      # Quick quit
Space z      # Toggle Goyo (distraction-free)

# Split navigation
Ctrl h/j/k/l # Navigate between splits
```

## Updating Dotfiles

### Pull Latest Changes

```bash
cd ~/.dotfiles
git pull
stow -R *  # Re-stow to apply changes
```

### Push Your Changes

```bash
cd ~/.dotfiles
git add .
git commit -m "Update configuration"
git push
```

## Dependencies

### Essential
- `git` - Version control
- `stow` - Symlink manager

### Recommended
- `vim` - Text editor
- `tmux` - Terminal multiplexer
- `bat` - Better cat
- `fzf` - Fuzzy finder
- `ripgrep` - Fast grep
- `fish` - Friendly shell (optional)

### Install on Arch

```bash
sudo pacman -S git stow vim tmux bat fzf ripgrep fish htop ncmpcpp mpd mpv
```

### Install on Debian/Ubuntu

```bash
sudo apt install git stow vim tmux bat fzf ripgrep fish htop ncmpcpp mpd mpv
```

## Uninstalling

```bash
# Remove symlinks for specific package
cd ~/.dotfiles
stow -D bash

# Remove all symlinks
stow -D *

# Delete dotfiles (optional)
rm -rf ~/.dotfiles
```

## Troubleshooting

### Stow Conflicts

If stow complains about existing files:

```bash
# Backup existing files
mkdir ~/.dotfiles_backup
mv ~/.bashrc ~/.dotfiles_backup/

# Then stow
stow bash
```

### Tmux Plugins Not Loading

```bash
# Make sure TPM is installed
ls ~/.config/tmux/plugins/tpm

# In tmux, press: Ctrl+Space I
```

### Vim Plugins Not Working

```bash
# Reinstall vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim +PlugInstall +qall
```

## License

MIT License - Feel free to use and modify as needed.

## Credits

- [GNU Stow](https://www.gnu.org/software/stow/) - Symlink farm manager
- Inspired by the dotfiles community

## Author

jacobkvela - [GitHub](https://github.com/jacobkvela)
