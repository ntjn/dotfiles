"General settings
"___________________________________________________________________
syntax on

set relativenumber
set number
set showcmd
set paste

let mapleader=','

"Tab config
map é :tabn<CR>
map á :tabp<CR>

"Indent config
vnoremap < <gv
vnoremap > >gv
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

"Custom maps
map ö <C-]>
map ü <C-o>
map <Space> /
map í ?
map <C-h> :wincmd h<CR>
map <C-j> <C-e>j
map <C-k> <C-y>k
map <C-l> :wincmd l<CR>
map ó :call Rmprefix()<CR>
map ú :call Rmsuffix()<CR>
map ű :!ctags -R .

"Folding
set foldmethod=marker

"Spellcheck
"set spell spelllang=en_gb

"Skeletons
"___________________________________________________________________
au BufNewFile *.html    0r ~/.vim/.skel/.html
    \ | :normal G
au BufNewFile *.sh      0r ~/.vim/.skel/.sh
    \ | :normal G
au BufNewFile *.py      0r ~/.vim/.skel/.py
    \ | :normal G
au BufNewFile *.c       0r ~/.vim/.skel/.c
    \ | :normal 5G
au BufNewFile *.cpp     0r ~/.vim/.skel/.cpp
    \ | :normal 5G
au BufNewFile *.java    0r ~/.vim/.skel/.java
    \ | :normal 5G
au BufNewFile *.hs      0r ~/.vim/.skel/.hs
    \ | :normal G

"YAML indent
"___________________________________________________________________
au FileType yaml setl sw=2 sts=2 et
au FileType xml setl sw=2 sts=2 et

"Snippets
"___________________________________________________________________
nnoremap ,html :read ~/.vim/.skel/.html<CR>

"Plugins
"___________________________________________________________________
execute pathogen#infect()
filetype plugin indent on

"Helpers
"___________________________________________________________________
"Substrings of commands

"Remove prefix of a command
"  where prefix is the name of the command with its flags
function Rmprefix()
    execute 's/\v[ \t]*[^ ]*[ \t]*([-]+[a-zA-Z-_.]*[ ]*)*[\|]?//'
endfunction

"Remove suffix of a line
"  where suffix is anything after the prefix
function Rmsuffix()
    execute 's/\v([ \t]*[^ ]*[ \t]*[-]+[a-zA-Z-_.]*[ ]*).*/\1/'
endfunction

"Keep suffix of a command before pipe
function Keepsuffix()
    execute 's/\v[ \t]*[^ ]*[ \t]*([-]+[a-zA-Z-_.]*[ ]*)*([^| \t]*).*/\2/'
endfunction

"Auto open nerdtree bar
function OpenTree()
    NERDTree
    set relativenumber
    set number
endfunction

function OpenTreeChangingWindow()
    call OpenTree()
    wincmd w
endfunction

autocmd VimEnter * call OpenTree()
autocmd VimEnter *rc,*.conf,*.sh,*.py,*.h,*.c,*.cc,*.cpp,*.hs,*.kt,*.java call OpenTreeChangingWindow()

