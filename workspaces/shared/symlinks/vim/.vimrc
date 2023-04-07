" Use Vim settings, rather than Vi settings.
set nocompatible

" Switch syntax highlighting on.
syntax on

" Enable file type detection and language-dependent indenting.
filetype plugin indent on

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Number of lines to check for modelines.
set modelines=2

" Show the line number for each line.
set number

" Show cursor position below each window.
set ruler

" Use a visual bell instead of beeping.
set visualbell

" Use UTF-8 as the character encoding used in Vim.
set encoding=utf-8

" Wrap long lines.
set wrap

" Number of spaces a <Tab> in the text stands for.
set tabstop=2

" Number of spaces used for each step of (auto)indent.
set shiftwidth=2
set shiftround

" Number of spaces to insert for a <Tab>.
set softtabstop=2

" Expand <Tab> to 'shiftwidth' spaces in Insert mode.
set expandtab smarttab

" Automatically set the indent of a new line.
set autoindent smartindent

set laststatus=2
set showmode

" Number of screen lines to show around the cursor.
set scrolloff=5

" Ignore case when using a search pattern, except when the pattern contains uppercase characters.
set ignorecase smartcase

" Highlight all matches of a search pattern.
set hlsearch

" Show match for partly typed search command.
set incsearch

" Enable the use of the mouse.
set mouse=ar

" Use the default color scheme.
colorscheme default

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %t\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ pct:\ %p%%

" Show the status on the second to last line.
set laststatus=2
