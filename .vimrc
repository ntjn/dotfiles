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
map <Space> /
map í ?
map <C-h> :wincmd h<CR>
map <C-j> <C-e>j
map <C-k> <C-y>k
map <C-l> :wincmd l<CR>
map ó :call Rmprefix()<CR>
map ú :call Rmsuffix()<CR>
map ű :!ctags -R .<CR>
map É <C-w><C-]>
map Á <C-]>
map ö :exec "pop " .  (gettagstack()["curidx"] - 1)<CR>
map ü <C-t>
map Ü :call MoveWindow()<CR>

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

"Close the current window and open it as a tab
function MoveWindow()
    let w = bufname("%")
    q
    exec ":tabe " . w
endfunction

"Skip comment at the top of the file
function SkipComments()
    while getline(".")[:1] == "//"
        execute ":normal \<C-j>"
    endwhile
endfunction

"Config only applied to nerdtree bar
function ConfigNerdtree()
    set relativenumber
    set number
endfunction

function OpenTree()
    NERDTree
    call ConfigNerdtree()
endfunction

function OpenTreeChangingWindow()
    call OpenTree()
    wincmd w
endfunction

"Auto open nerdtree bar
au VimEnter * call OpenTree()
au VimEnter *rc,*.conf,*.sh,*.py,*.h,*.c,*.cc,*.cpp,*.hs,*.kt,*.java call OpenTreeChangingWindow()

"Auto close nerdtree
au BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Skip comments
au BufRead * call SkipComments()
