# Dotfiles

Personal configuration files managed with GNU Stow, featuring Gruvbox theming and cross-platform compatibility.

## Quick Start

### One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/jacobkvela/.dotfiles/main/install.sh | bash
```

### Manual Install

```bash
# Clone the repository
git clone git@github.com:jacobkvela/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install GNU Stow
sudo pacman -S stow  # Arch Linux
sudo apt install stow  # Ubuntu/Debian

# Install all dotfiles
stow bash bat fish git htop mpd ncmpcpp tmux vim

# Or selectively install
stow bash git tmux vim
```

## What's Included

### Core Configuration
- **bash** - Shell with enhanced aliases and productivity shortcuts
- **git** - Version control with GPG commit signing
- **vim** - Text editor with plugins (vim-plug, FZF, NERDTree, Gruvbox)
- **tmux** - Terminal multiplexer with Gruvbox theme and 14 popups

### Utilities
- **bat** - Syntax-highlighted file viewer
- **htop** - System monitor configuration
- **ncmpcpp** - Music player UI
- **mpd** - Music Player Daemon
- **mpv** - Video player
- **fish** - Friendly interactive shell (optional)

## Features

### Gruvbox Theme
Consistent Gruvbox dark theme across:
- Vim editor
- Tmux status bar and panes
- Terminal color scheme

### Productivity Enhancements
- **FZF integration** - Fuzzy file finding in vim and bash
- **Bat** - Better `cat` with syntax highlighting
- **Smart aliases** - 50+ time-saving shortcuts
- **Tmux popups** - Quick access to tools without leaving tmux

### Security Features
- Safe file operation aliases (prevent accidental deletions)

## Repository Structure

```
~/.dotfiles/
├── bash/
│   ├── .bashrc           # Shell configuration
│   ├── .bash_profile     # Login shell
│   └── .bash_aliases     # 50+ productivity aliases
├── git/
│   └── .gitconfig        # Git config with GPG signing
├── tmux/
│   └── .config/tmux/
│       └── tmux.conf     # Gruvbox theme + 14 popups
├── vim/
│   └── .vimrc            # Vim config with plugins
├── install.sh            # Automated installer
└── README.md             # This file
```

## Post-Installation

### 1. Install Vim Plugins

```bash
# Vim-plug auto-installs, then run:
vim +PlugInstall +qall
```

Included plugins:
- **Gruvbox** - Color scheme
- **FZF** - Fuzzy finder
- **NERDTree** - File explorer
- **Goyo + Limelight** - Distraction-free writing

### 2. Install Tmux Plugin Manager (TPM)

```bash
# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# In tmux, press: Ctrl+Space I (capital I)
```

## Key Features

### Bash Aliases

Navigate faster:
```bash
..          # cd ..
...         # cd ../..
-           # cd to previous directory
```

File operations:
```bash
ll          # ls -alF (detailed list)
lt          # ls by modification time
lsize       # ls by file size
cat         # bat with syntax highlighting
```

System management (Arch):
```bash
install     # sudo pacman -S
update      # sudo pacman -Syy
upgrade     # sudo pacman -Syu
search      # pacman -Ss
```

Utilities:
```bash
serve       # Python HTTP server (port 8000)
fman        # Fuzzy search man pages
reload      # Reload bash config
```

Quick edits:
```bash
aliases     # Edit and reload aliases
bashrc      # Edit and reload bashrc
vimrc       # Edit vimrc
tmuxconf    # Edit tmux.conf
```

### Tmux Keybindings

**Prefix:** `Ctrl+Space`

#### Window Management
```bash
Ctrl+Space c        # New window
Ctrl+Space n        # Next window
Ctrl+Space p        # Previous window
Ctrl+Space ,        # Rename window
Ctrl+Space &        # Kill window
```

#### Pane Management
```bash
Ctrl+Space \        # Split vertically
Ctrl+Space -        # Split horizontally
Ctrl+Space h/j/k/l  # Resize panes (vim-style)
Ctrl+Space m        # Maximize/unmaximize pane
Ctrl+Space arrows   # Navigate panes
Ctrl+Space x        # Kill pane
```

#### Tmux Popups
```bash
Ctrl+Space M        # Music player (ncmpcpp)
Ctrl+Space H        # System monitor (htop)
Ctrl+Space G        # Git status
Ctrl+Space L        # Git log
Ctrl+Space F        # File finder (find + fzf + bat preview)
Ctrl+Space S        # Search in files (ripgrep + fzf)
Ctrl+Space N        # Quick notes (vim ~/scratch.md)
Ctrl+Space C        # Calendar (3 months)
Ctrl+Space =        # Calculator (Python)
Ctrl+Space m        # Man pages (fuzzy search)
Ctrl+Space P        # Process viewer (ps + fzf)
Ctrl+Space ?        # Tmux keybindings help
Ctrl+Space d        # Directory navigation
Ctrl+Space /        # Package search
```

#### Copy Mode (Vim-style)
```bash
Ctrl+Space [        # Enter copy mode
v                   # Start selection
y                   # Yank (copy to clipboard)
Ctrl+Space P        # Paste
```

#### Other
```bash
Ctrl+Space r        # Reload tmux config
Ctrl+Space t        # Show clock
```

### Vim Keybindings

**Leader:** `Space`

#### File Navigation
```bash
Space f      # Find files (FZF)
Space b      # Browse buffers
Space g      # Search in files (Ripgrep)
Space t      # Browse tags
Space n      # Toggle NERDTree
```

#### Editing
```bash
Space Space  # Clear search highlight
Space w      # Quick save
Space q      # Quick quit
Space z      # Toggle Goyo (distraction-free mode)
```

#### Split Navigation
```bash
Ctrl h       # Move to left split
Ctrl j       # Move to down split
Ctrl k       # Move to up split
Ctrl l       # Move to right split
```

#### Split Resizing
```bash
Space h      # Decrease width
Space j      # Increase height
Space k      # Decrease height
Space l      # Increase width
```

## Multi-Machine Setup

### Branch Strategy

This repository supports multiple machines:

- **`main` branch** - Primary configuration (Arch Linux)
- **`ubuntu` branch** - Ubuntu/Debian specific tweaks

### For Ubuntu/Debian Users

The dotfiles work on Ubuntu but package management aliases use Arch commands. To use on Ubuntu:

```bash
# Clone and checkout ubuntu branch
git clone git@github.com:jacobkvela/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout ubuntu
stow bash bat fish git htop mpd ncmpcpp tmux vim
```

Or modify `.bash_aliases` to detect OS:
```bash
if command -v pacman &> /dev/null; then
    alias install='sudo pacman -S'
elif command -v apt &> /dev/null; then
    alias install='sudo apt install'
fi
```

## Updating Dotfiles

### Pull Latest Changes

```bash
cd ~/.dotfiles
git pull
stow -R bash git tmux vim  # Re-stow to update symlinks
```

### Push Your Changes

```bash
cd ~/.dotfiles
git add .
git commit -S -m "Update configuration"  # -S for GPG signing
git push
```

## Dependencies

### Essential
- `git` - Version control
- `stow` - Symlink manager
- `vim` - Text editor
- `tmux` - Terminal multiplexer

### Recommended
- `bat` - Better cat (`batcat` on Ubuntu)
- `fzf` - Fuzzy finder
- `ripgrep` - Fast grep
- `htop` - System monitor
- `xclip` - Clipboard (X11) or `wl-copy` (Wayland)

### Optional
- `ncmpcpp` + `mpd` - Music player
- `mpv` - Video player
- `fish` - Alternative shell
- `dust` - Better du
- `tree` - Directory tree viewer

### Install All Dependencies

**Arch Linux:**
```bash
sudo pacman -S git stow vim tmux bat fzf ripgrep htop xclip ncmpcpp mpd mpv fish dust tree
```

**Ubuntu/Debian:**
```bash
sudo apt install git stow vim tmux bat fzf ripgrep htop xclip ncmpcpp mpd mpv fish tree
# Note: bat is 'batcat' on Ubuntu
```

## Troubleshooting

### Stow Conflicts

If stow complains about existing files:

```bash
# Backup existing files
mkdir ~/.dotfiles_backup
mv ~/.bashrc ~/.bash_aliases ~/.gitconfig ~/.dotfiles_backup/

# Then stow
cd ~/.dotfiles
stow bash git tmux vim
```

The install script automatically backs up conflicting files.

### Tmux Colors Not Working

Ensure your terminal supports 256 colors and true color:

```bash
# Check TERM variable
echo $TERM

# Should be: screen-256color (in tmux) or xterm-256color

# Test true color
curl -s https://raw.githubusercontent.com/JohnMorales/dotfiles/master/colors/24-bit-color.sh | bash
```

### Bat Command Not Found (Ubuntu)

On Ubuntu, `bat` is installed as `batcat`:

```bash
# Create symlink
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Or use the alias (already in .bash_aliases)
```

### Vim Plugins Not Loading

```bash
# Reinstall vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
vim +PlugInstall +qall
```

## Uninstalling

```bash
# Remove symlinks
cd ~/.dotfiles
stow -D bash bat fish git htop mpd ncmpcpp tmux vim

# Remove dotfiles directory (optional)
rm -rf ~/.dotfiles

# Restore backups if needed
cp ~/.dotfiles_backup/* ~/
```

## Contributing

This is a personal dotfiles repository, but feel free to fork and adapt for your own use!

## License

MIT License - Use and modify as needed.

## Credits

- [GNU Stow](https://www.gnu.org/software/stow/) - Symlink farm manager
- [Gruvbox](https://github.com/morhetz/gruvbox) - Retro groove color scheme
- [vim-plug](https://github.com/junegunn/vim-plug) - Minimalist vim plugin manager
- [TPM](https://github.com/tmux-plugins/tpm) - Tmux plugin manager
- Inspired by the dotfiles community

## Author

**jacobkvela** - [GitHub](https://github.com/jacobkvela)

---

**Note:** These dotfiles are actively maintained and tested on Arch Linux. Ubuntu/Debian compatibility is provided via the `ubuntu` branch.
