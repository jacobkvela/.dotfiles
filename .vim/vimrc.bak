"==========================================================
" ProjectLink: https://github.com/jacobkvela/dotfiles/.vimrc
" Author:  jacobkvela
" Version: 0.2
" ReadMe: README.md
" Description: vimrc config
"==========================================================

" BASIC SETUP:

"========================================================="

" leader
let mapleader = ''
let g:mapleader = ''

"========================================================="

" set FZF Default to Ripgrep (must install ripgrep)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs'

" history : how many lines of history VIM has to remember
set history=2000

" enable syntax and plugins (for netrw)
syntax enable
syntax on

" filetype
filetype on

" enable filetype plugins
filetype plugin on
filetype indent on

"========================================================="

" BASE:
set nocompatible                " no vi compatibility
set hidden                      "
set noswapfile                  " disable swap
set colorcolumn=80              " column boarder
set guicursor=                  " block cursor
set laststatus=2                " status bar
set nocompatible                " don't bother with vi compatibility
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set shortmess=atI
set magic                       " For regular expressions turn magic on
set title                       " change the terminal's title
set nobackup                    " do not keep a backup file
set t_vb=                       " no error beep / flash
set tm=500                      " ?
set scrolloff=7                 " keep 7 lines when scrolling

"========================================================="

" show
set ruler                       " show the current row and column
set nu                          " show line number
set relativenumber              " show relative number to the current line
set nowrap                      " no wrapping
set noshowcmd                   " don't display incomplete commands
set showmode                    " display current modes
set showmatch                   " jump to matches when entering parentheses
set matchtime=2                 " tenths of a second to show the matching parenthesis

"========================================================="

" search
set hlsearch                    " highlight searches
set incsearch                   " do incremental searching, search as you type
set ignorecase                  " ignore case when searching
set smartcase                   " no ignorecase if Uppercase char present

"========================================================="

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

"========================================================="

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags
" leader

"========================================================="

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

"========================================================="

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

"========================================================="

" SNIPPETS:

" Read an empty HTML template and move cursor to title
"nnoremap .html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

"========================================================="

"options viewable by using :options
"set options viewable by using :set all
"help for individual options :help <name>

"========================================================="

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"
"   " You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"
" Make sure you use single quotes

" Gruvbox Colorscheme
Plug 'morhetz/gruvbox'

" Distracton-free writing in vim
Plug 'junegunn/goyo.vim'

" Hyperfocus-writing in Vim
Plug 'junegunn/limelight.vim'

" Fzf is a general-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Directory tree
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

"========================================================="

" Color Settings
colorscheme gruvbox
set bg=dark
set termguicolors

"========================================================="

" LimeLight Setting
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

"========================================================="

" Goyo Settings

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight
    "...
endfunction

function! s:goyo_leave()
    set noshowmode
    set noshowcmd
    set scrolloff=5
    Limelight!
    "...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"end of vimrc
