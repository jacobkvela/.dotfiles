"==========================================================
" ProjectLink: https://github.com/jacobkvela/dotfiles/.vimrc
" Author:  jacobkvela
" Version: 0.3
" ReadMe: README.md
" Description: vimrc config - cleaned and improved
"==========================================================

"==========================================================
" VIM-PLUG AUTO-INSTALL:
"==========================================================
" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"==========================================================
" LEADER KEY:
"==========================================================
" Set leader to spacebar (matches your tmux prefix!)
let mapleader = ' '
let g:mapleader = ' '

"==========================================================
" BASE SETTINGS:
"==========================================================
set nocompatible                " don't bother with vi compatibility
set hidden                      " allow hidden buffers
set noswapfile                  " disable swap files
set nobackup                    " do not keep backup files
set autoread                    " reload files when changed on disk
set history=2000                " command history

" Display
set ruler                       " show cursor position
set number                      " show line numbers
set relativenumber              " show relative line numbers
set nowrap                      " don't wrap lines
set showmode                    " display current mode
set noshowcmd                   " don't display incomplete commands
set showmatch                   " show matching brackets
set matchtime=2                 " tenths of a second to show matching bracket
set colorcolumn=80              " column border at 80 chars
set laststatus=2                " always show status line
set scrolloff=7                 " keep 7 lines when scrolling
set title                       " change terminal title

" Search
set hlsearch                    " highlight searches
set incsearch                   " incremental searching
set ignorecase                  " ignore case when searching
set smartcase                   " unless uppercase is present

" Indentation
set tabstop=4                   " visual spaces per TAB
set softtabstop=4               " spaces in tab when editing
set shiftwidth=4                " spaces for autoindent
set expandtab                   " tabs are spaces
set smartindent                 " smart indent
set autoindent                  " always autoindent

" Behavior
set backspace=indent,eol,start  " backspace works as expected
set mouse=a                     " enable mouse support
set clipboard=unnamedplus       " use system clipboard
set encoding=utf-8              " set encoding
set magic                       " for regex
set tm=500                      " timeout for mappings
set t_vb=                       " no visual bell

" Syntax and filetypes
syntax enable
syntax on
filetype plugin indent on

" Cursor
set guicursor=                  " block cursor

"==========================================================
" FINDING FILES:
"==========================================================
" Search down into subfolders
set path+=**
" Display all matching files when tab completing
set wildmenu
set wildmode=longest:full,full

"==========================================================
" TAG JUMPING:
"==========================================================
" Create ctags file
command! MakeTags !ctags -R .

"==========================================================
" FILE BROWSING (NETRW):
"==========================================================
let g:netrw_banner=0            " disable banner
let g:netrw_browse_split=4      " open in prior window
let g:netrw_altv=1              " open splits to the right
let g:netrw_liststyle=3         " tree view

" Hide gitignored files
if exists('*netrw_gitignore#Hide')
    let g:netrw_list_hide=netrw_gitignore#Hide()
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
endif

"==========================================================
" FZF SETTINGS:
"==========================================================
" Set FZF to use ripgrep
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'

"==========================================================
" PLUGINS (VIM-PLUG):
"==========================================================
call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'morhetz/gruvbox'

" Writing tools
Plug 'junegunn/goyo.vim'        " distraction-free writing
Plug 'junegunn/limelight.vim'   " hyperfocus writing

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File tree
Plug 'scrooloose/nerdtree'

call plug#end()

"==========================================================
" COLOR SCHEME:
"==========================================================
colorscheme gruvbox
set background=dark
set termguicolors

"==========================================================
" LIMELIGHT SETTINGS:
"==========================================================
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

"==========================================================
" GOYO SETTINGS:
"==========================================================
function! s:goyo_enter()
    set scrolloff=999
    Limelight
endfunction

function! s:goyo_leave()
    set scrolloff=7
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"==========================================================
" KEY MAPPINGS:
"==========================================================

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Better split navigation (like tmux!)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <leader>h :vertical resize -5<CR>
nnoremap <leader>j :resize +5<CR>
nnoremap <leader>k :resize -5<CR>
nnoremap <leader>l :vertical resize +5<CR>

" FZF mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<Space>
nnoremap <leader>G :Rg <C-R><C-W><CR>
nnoremap <leader>t :Tags<CR>

" NERDTree toggle
nnoremap <leader>n :NERDTreeToggle<CR>

" Goyo toggle
nnoremap <leader>z :Goyo<CR>

" Quick save
nnoremap <leader>w :w<CR>

" Quick quit
nnoremap <leader>q :q<CR>

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Yank to end of line (consistent with C and D)
nnoremap Y y$

"==========================================================
" AUTOCMD:
"==========================================================

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"==========================================================
" NOTES:
"==========================================================
" Leader Key Commands (with <Space> as leader):
"   <Space><Space> - Clear search highlighting
"   <Space>f       - Find files (FZF)
"   <Space>b       - Browse buffers (FZF)
"   <Space>g       - Grep/search in files (ripgrep)
"   <Space>t       - Browse tags
"   <Space>n       - Toggle NERDTree
"   <Space>z       - Toggle Goyo (distraction-free)
"   <Space>w       - Quick save
"   <Space>q       - Quick quit
"   <Space>hjkl    - Resize splits
"
" Split Navigation:
"   Ctrl+h/j/k/l   - Navigate between splits
"
" Installing Plugins:
"   :PlugInstall   - Install plugins
"   :PlugUpdate    - Update plugins
"   :PlugClean     - Remove unused plugins
"
" FZF:
"   Ctrl+t         - Open in new tab
"   Ctrl+x         - Open in split
"   Ctrl+v         - Open in vertical split
"==========================================================
" End of vimrc
