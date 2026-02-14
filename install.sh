#!/usr/bin/env bash
#==========================================================
# Dotfiles Installation Script
# Description: Sets up dotfiles from GitHub on a new machine
# Author: jacobkvela
# Usage: curl -fsSL https://raw.githubusercontent.com/jacobkvela/dotfiles/main/install.sh | bash
#==========================================================

set -e

#==========================================================
# COLORS
#==========================================================
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
RESET='\033[0m'

print_success() { echo -e "${GREEN}✓ $1${RESET}"; }
print_error() { echo -e "${RED}✗ $1${RESET}" >&2; }
print_warning() { echo -e "${YELLOW}⚠ $1${RESET}"; }
print_info() { echo -e "${CYAN}ℹ $1${RESET}"; }

#==========================================================
# CONFIGURATION
#==========================================================
# Default to HTTPS (works for everyone)
DOTFILES_REPO="https://github.com/jacobkvela/dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"

# Check if SSH key is available and use SSH instead
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    DOTFILES_REPO="git@github.com:jacobkvela/dotfiles.git"
    print_info "Using SSH for git clone"
else
    print_info "Using HTTPS for git clone"
fi

#==========================================================
# BANNER
#==========================================================
echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║     Dotfiles Installation Script             ║"
echo "║     Author: jacobkvela                       ║"
echo "╚══════════════════════════════════════════════╝"
echo ""

#==========================================================
# CHECK PREREQUISITES
#==========================================================
print_info "Checking prerequisites..."

# Check for git
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install git first."
    exit 1
fi

# Check for stow
if ! command -v stow &> /dev/null; then
    print_warning "Stow is not installed."
    read -p "Install stow? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v pacman &> /dev/null; then
            sudo pacman -S stow
        elif command -v apt &> /dev/null; then
            sudo apt install stow
        elif command -v dnf &> /dev/null; then
            sudo dnf install stow
        else
            print_error "Could not install stow automatically. Please install manually."
            exit 1
        fi
        print_success "Stow installed"
    else
        print_error "Stow is required. Exiting."
        exit 1
    fi
fi

print_success "Prerequisites met"
echo ""

#==========================================================
# CLONE DOTFILES
#==========================================================
if [ -d "$DOTFILES_DIR" ]; then
    print_warning "Dotfiles directory already exists at $DOTFILES_DIR"
    read -p "Remove and re-clone? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$DOTFILES_DIR"
    else
        print_info "Using existing dotfiles directory"
        cd "$DOTFILES_DIR"
        git pull origin main
    fi
fi

if [ ! -d "$DOTFILES_DIR" ]; then
    print_info "Cloning dotfiles from $DOTFILES_REPO..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    print_success "Dotfiles cloned"
fi

cd "$DOTFILES_DIR"
echo ""

#==========================================================
# BACKUP EXISTING FILES
#==========================================================
print_info "Backing up existing dotfiles..."

BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
BACKED_UP=false

# List of files/directories that might conflict
DOTFILES_TO_BACKUP=(
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
    "$HOME/.bash_aliases"
    "$HOME/.gitconfig"
    "$HOME/.vimrc"
    "$HOME/.config/tmux"
    "$HOME/.config/fish"
    "$HOME/.config/ncmpcpp"
    "$HOME/.config/bat"
    "$HOME/.config/htop"
)

for file in "${DOTFILES_TO_BACKUP[@]}"; do
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        if [ "$BACKED_UP" = false ]; then
            mkdir -p "$BACKUP_DIR"
            BACKED_UP=true
        fi

        # Preserve directory structure
        target_dir="$BACKUP_DIR/$(dirname "${file#$HOME/}")"
        mkdir -p "$target_dir"

        cp -r "$file" "$target_dir/"
        print_info "Backed up: $file"
    fi
done

if [ "$BACKED_UP" = true ]; then
    print_success "Backup created at: $BACKUP_DIR"
else
    print_info "No existing files to backup"
fi
echo ""

#==========================================================
# SELECT PACKAGES TO INSTALL
#==========================================================
print_info "Available dotfile packages:"
echo ""

# Get list of packages (directories in .dotfiles)
PACKAGES=()
for dir in "$DOTFILES_DIR"/*/; do
    package=$(basename "$dir")
    # Skip hidden directories
    if [[ ! "$package" =~ ^\. ]]; then
        PACKAGES+=("$package")
        echo "  • $package"
    fi
done

echo ""
print_info "Installation options:"
echo "  1) Install all packages"
echo "  2) Select packages interactively"
echo "  3) Manual (skip stow, I'll do it myself)"
echo ""

read -p "Choose option (1-3): " -n 1 -r
echo
echo ""

case $REPLY in
    1)
        print_info "Installing all packages..."
        stow "${PACKAGES[@]}"
        print_success "All packages installed"
        ;;
    2)
        print_info "Select packages to install:"
        SELECTED=()
        for package in "${PACKAGES[@]}"; do
            read -p "Install $package? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                SELECTED+=("$package")
            fi
        done

        if [ ${#SELECTED[@]} -gt 0 ]; then
            print_info "Installing selected packages..."
            stow "${SELECTED[@]}"
            print_success "Selected packages installed"
        else
            print_warning "No packages selected"
        fi
        ;;
    3)
        print_info "Skipping stow. Run manually with:"
        echo "  cd ~/.dotfiles"
        echo "  stow bash git tmux  # or stow *"
        ;;
    *)
        print_error "Invalid option"
        exit 1
        ;;
esac

echo ""

#==========================================================
# POST-INSTALL TASKS
#==========================================================
print_info "Post-installation tasks:"
echo ""

# Vim plugin manager
if [ -d "$DOTFILES_DIR/vim" ]; then
    if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
        print_warning "Vim-plug not installed"
        read -p "Install vim-plug and plugins? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
                https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            vim +PlugInstall +qall
            print_success "Vim plugins installed"
        fi
    fi
fi

# Tmux plugin manager
if [ -d "$DOTFILES_DIR/tmux" ]; then
    if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
        print_warning "TPM (Tmux Plugin Manager) not installed"
        read -p "Install TPM? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mkdir -p "$HOME/.config/tmux/plugins"
            git clone https://github.com/tmux-plugins/tpm \
                "$HOME/.config/tmux/plugins/tpm"
            print_success "TPM installed"
            print_info "Open tmux and press Ctrl+Space I to install plugins"
        fi
    fi
fi

# Fish shell
if [ -d "$DOTFILES_DIR/fish" ]; then
    if command -v fish &> /dev/null; then
        print_info "Fish shell detected"
        read -p "Make Fish your default shell? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            chsh -s "$(which fish)"
            print_success "Fish set as default shell (restart required)"
        fi
    fi
fi

echo ""

#==========================================================
# COMPLETION
#==========================================================
print_success "Dotfiles installation complete!"
echo ""
print_info "Next steps:"
echo "  1. Restart your terminal or run: source ~/.bashrc"
echo "  2. Install any missing programs (bat, fzf, ripgrep, etc.)"
echo "  3. Customize further if needed"
echo ""

if [ "$BACKED_UP" = true ]; then
    print_info "Your old dotfiles are backed up at:"
    echo "  $BACKUP_DIR"
    echo ""
fi

print_info "To update dotfiles in the future:"
echo "  cd ~/.dotfiles"
echo "  git pull"
echo "  stow -R *  # Re-stow to apply changes"
echo ""
