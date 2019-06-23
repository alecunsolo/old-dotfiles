set nu
synt on
set nowrap
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
execute "set colorcolumn=" . join(range(81, 255), ',')
highlight ColorColumn ctermbg=236
let $LOCALFILE=expand("~/.vimrc.local")
set nocp
set backspace=indent,eol,start
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
set pastetoggle=<F2>
