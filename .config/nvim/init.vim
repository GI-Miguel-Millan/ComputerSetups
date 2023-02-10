set clipboard=unnamedplus         " use system clipboard for yanking/pasting
set ignorecase                    " Case insensitive searching
set hlsearch                      " Highlight search results
set incsearch                     " enable incremental searching
set showmatch                     " Show matching parenthesis
set mouse=v                       " Middle-click will paste clipboard
set mouse=a                       " Enable mouse clicking
set tabstop=4                     " Sets the number of columns occupied by a tab
set softtabstop=4                 " Sees multiple spaces as tabstops so that backspace works as expected
set expandtab                     " Converts tabs to white space
set shiftwidth=4                  " width for autoindents
set autoindent                    " indent a new line the same amount as the line just typed
set number                        " add line numbers
set wildmode=longest,list         " tab completion for vim commands 
set cc=80                         " set an 80 column border
filetype plugin indent on         " Detects filetype -> attempts to load appropriate plugin for syntax highlighting for that filetype -> attempts to load appropriate indent file for that filetype.
syntax on                         " Enables syntax highlighting.
set cursorline                    " Underlines the line your cursor is on.
set ttyfast                       " Speed up scrolling in vim

