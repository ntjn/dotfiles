"General settings
"___________________________________________________________________
syntax on

set relativenumber
set number
set showcmd
set paste
"set omnifunc=syntaxcomplete#Complete
"set complete=.,w,b,u,t,i,kspell

let mapleader=','

"Tab settings
map é :tabn<CR>
map á :tabp<CR>

"Indent settings
vnoremap < <gv
vnoremap > >gv
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

"Custom maps
map ö <C-]>
map ü <C-o>
map <C-j> <C-e>j
map <C-k> <C-y>k

"Search
map <Space> /
map í ?

"Delete prefix
map ó :s/\v[^ ]*[ ]([-][a-zA-Z-_.]*[ ]*)*[\|]?//<CR>
"Delete suffix
map ü :s/\v([a-zA-Z.-_]*).*/\1/<CR>

function Rmprefix()
	execute 's/\v[^ ]*[ ]([-][a-zA-Z-_.]*[ ]*)*[\|]?//'
endfunction

function Rmsuffix()
	execute 's/\v([a-zA-Z.-_/]*).*/\1/'
endfunction

function Keepinfix()
	execute 's/\v[^ ]*[ ]([-][a-zA-Z-_.]*[ ]*)*[\|]?//'
	execute 's/\v([a-zA-Z.-_/]*).*/\1/'
endfunction

"map ó /\"<CR>lv/"<CR>hxi
"map ó /\'<CR>lv/'<CR>hxi

"function Insquote()
"endfunction

"Folding
set foldmethod=marker

"Spellcheck
"set spell spelllang=en_gb

"Skeletons
"___________________________________________________________________
au BufNewFile *.html	0r ~/.vim/.skel/.html
	\ | :normal G
au BufNewFile *.sh	0r ~/.vim/.skel/.sh
	\ | :normal G
au BufNewFile *.py	0r ~/.vim/.skel/.py
	\ | :normal G
au BufNewFile *.c	0r ~/.vim/.skel/.c
	\ | :normal 5G
au BufNewFile *.cpp	0r ~/.vim/.skel/.cpp
	\ | :normal 5G
au BufNewFile *.java	0r ~/.vim/.skel/.java
	\ | :normal 5G
au BufNewFile *.hs	0r ~/.vim/.skel/.hs
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
"execute pathogen#infect()
"filetype plugin indent on

"Magic
"___________________________________________________________________
":TOhtml        - export file as html with colors and numbers

"Required by vim presentation
"___________________________________________________________________
"autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'make']

":redir @* | set guifont | redir END

"colorscheme ntj

"set viminfo+=n~/.vim/viminfo

