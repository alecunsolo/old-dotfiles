set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set nu
synt on
set nowrap
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set nocp
set backspace=indent,eol,start
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
call plug#end()

" Ctrl-n toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" If no files were specified fire NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show powerline fonts
let g:airline_powerline_fonts = 1
