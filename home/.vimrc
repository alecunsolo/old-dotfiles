" Vim, not Vi
set nocompatible

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set number
set nowrap
syntax on

" Search stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

filetype plugin indent on

" indendation stuff
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

" reload a file if changed
set autoread
set pastetoggle=<F2>

" For statusbar
set laststatus=2

" Download vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
" Installed with pacman
" Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" vimgutter relies on this value to refresh signs
set updatetime=100

" Ctrl-n toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" If no files were specified fire NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1

" reload a file if changed
set autoread
" use F2 to toggle paste
set pastetoggle=<F2>

" For statusbar
set laststatus=2

" If no files were specified fire NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1

" Useful custom commands
command! Reload execute "source ~/.vimrc"
command! Filename execute ":echo expand('%:p')"
command! Config execute ":e $MYVIMRC"
